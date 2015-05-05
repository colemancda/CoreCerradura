//
//  Authentication.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 5/3/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import IDZSwiftCommonCrypto

// MARK: - Functions

/// Generates the authorization header used for authenticating HTTP requests.
///
/// :param: identifier The identifier (resource ID or username) of the entity trying to authenticate.
/// :param: secret The secret (e.g. password) of the entity trying to authenticate.
/// :param: request The URL request being made to the server. Request must include 'Date' and 'Content-MD5' headers
public func GenerateAuthorizationHeader(identifier: String, secret: String, request: NSURLRequest) -> String {
    
    // Modeled after AWS http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html#UsingTemporarySecurityCredentials
    
    let contentMD5 = request.valueForHTTPHeaderField("Content-MD5") ?? ""
    
    let dateString = request.valueForHTTPHeaderField("Date")!
    
    let stringToSign = request.HTTPMethod! + contentMD5 + request.URL!.path! + dateString
    
    let secretData = (secret as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
    
    let stringToSignData = (stringToSign as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
    
    let signedKeyBytes = HMAC(algorithm: HMAC.Algorithm.SHA512, key: secretData).update(secret)!.final()
    
    let signedKey = NSData(bytes: signedKeyBytes, length: signedKeyBytes.count)
    
    let base64Signature = signedKey.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)
    
    let jsonAuthorizationObject = [identifier: base64Signature]
    
    let jsonData = NSJSONSerialization.dataWithJSONObject(jsonAuthorizationObject, options: NSJSONWritingOptions.allZeros, error: nil)!
    
    let authorizationString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
    
    return authorizationString as! String
}