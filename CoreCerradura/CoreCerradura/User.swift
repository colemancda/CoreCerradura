//
//  User.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CoreData

public class User: NSManagedObject {

    public @NSManaged var archived: NSNumber
    public @NSManaged var created: NSDate
    public @NSManaged var email: String
    public @NSManaged var emailValidated: NSNumber
    public @NSManaged var password: String
    public @NSManaged var username: String
    public @NSManaged var actions: NSSet?
    public @NSManaged var permissions: NSSet?
    
    // MARK - Custom Accessors
    
    public var isArchived: Bool {
        
        return self.archived.boolValue
    }
    
    public var isEmailValidated: Bool {
        
        return self.isEmailValidated.boolValue
    }
    
    
}
