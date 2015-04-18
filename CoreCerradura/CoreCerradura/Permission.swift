//
//  Permission.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CoreData

/* A permission encapsulates access control for a specified lock and user. */
public class Permission: NSManagedObject {
    
    // MARK: - Properties

    // MARK: Attributes
    
    /* Whether this entity is archived or not. Archived entities are basically deleted, but still stored for historical purposes. */
    public @NSManaged var archived: NSNumber
    
    /* Date the permission was created. */
    public @NSManaged var created: NSDate
    
    /* The type of permission. Raw value for PermissionType. */
    public @NSManaged var type: String
    
    /* The date this permission becomes invalid. Not applicable to owner permissions. */
    public @NSManaged var endDate: NSDate?
    
    // MARK: Relationships
    
    /* The lock this permission is granting access for. */
    public @NSManaged var lock: Lock
    
    /* The user this permssion is granting access to. */
    public @NSManaged var user: User
    
    /* Permissions derived from this permission. */
    public @NSManaged var derivedPermissions: Set<Permisssion>?
    
    /* Permission this permission was derived from. */
    public @NSManaged var parentPermission: Permission?
    
    /* Actions involving this permission. */
    public @NSManaged var actions: Set<Action>?
    
    // MARK: - Custom Accessors
    
    public var isArchived: Bool {
        
        return self.archived.boolValue
    }
}
