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

    /* Whether this entity is archived or not. Archived entities are basically deleted, but still stored for historical purposes. */
    public @NSManaged var archived: NSNumber
    
    /* Date the permission was created. */
    public @NSManaged var created: NSDate
    public @NSManaged var email: String
    public @NSManaged var emailValidated: NSNumber
    public @NSManaged var password: String
    public @NSManaged var username: String
    public @NSManaged var actions: Set<Action>?
    public @NSManaged var permissions: Set<Permission>?
    
    // MARK: - Custom Accessors
    
    public var isArchived: Bool {
        
        return self.archived.boolValue
    }
    
    public var isEmailValidated: Bool {
        
        return self.isEmailValidated.boolValue
    }
    
    
}
