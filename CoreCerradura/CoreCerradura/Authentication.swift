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
/// :param: request The URL request being made to the server.
/// :param: requestBody The data being sent to the server.
public func GenerateAuthorizationHeader(identifier: String, secret: String, authenticationContext: AuthenticationContext) -> String {
    
    // Modeled after AWS http://docs.aws.amazon.com/AmazonS3/latest/dev/RESTAuthentication.html#UsingTemporarySecurityCredentials
    
    let httpVerb = request.HTTPMethod!
    
    let stringToSign = 
}

public class AuthenticationContext {
    
    let HTTPVerb: String
    
    let HTTPBody: NSData
    
    let date: NSDate = NSDate()
    
}