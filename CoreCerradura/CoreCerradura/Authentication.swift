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
/// :param: context The authentication context info. 
public func GenerateAuthenticationToken(identifier: String, secret: String, context: AuthenticationContext) -> String {
    
    // Modeled after AWS http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html#UsingTemporarySecurityCredentials
    
    let stringToSign = context.verb + context.path + context.dateString
    
    let secretData = (secret as NSString).dataUsingEncoding(NSUTF8StringEncoding)!
    
    let signedKeyBytes = HMAC(algorithm: HMAC.Algorithm.SHA512, key: secretData).update(stringToSign)!.final()
    
    let signedKey = NSData(bytes: signedKeyBytes, length: signedKeyBytes.count)
    
    let base64Signature = signedKey.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.allZeros)
    
    let jsonAuthorizationObject = [identifier: base64Signature]
    
    let jsonData = NSJSONSerialization.dataWithJSONObject(jsonAuthorizationObject, options: NSJSONWritingOptions.allZeros, error: nil)!
    
    let authorizationString = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
    
    return authorizationString as! String
}

// MARK: - Enumerations

/** Provides the context for authorization. Public information only. */
public struct AuthenticationContext {
    
    // MARK: - Properties
    
    public let verb: String
    
    public let path: String
    
    public let dateString: String
    
    // MARK: - Initialization
    
    public init(verb: String, path: String, dateString: String) {
        
        self.verb = verb
        self.path = path
        self.dateString = dateString
    }
}