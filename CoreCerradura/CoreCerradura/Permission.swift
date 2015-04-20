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
    @NSManaged public var archived: NSNumber
    
    /* Date the permission was created. */
    @NSManaged public var created: NSDate
    
    /* The date this permission becomes invalid. Not applicable for owner permissions. */
    @NSManaged public var endDate: NSDate?
    
    /* The starting time of the time interval the lock can be unlocked. Not applicable for admin / owner permissions. */
    @NSManaged public var scheduledStartTime: NSNumber?
    
    /* The ending time of the time interval the lock can be unlocked. Not applicable for admin / owner permissions. */
    @NSManaged public var scheduledEndTime: NSNumber?
    
    /* Whether the user can distribute keys derived from this permission. */
    @NSManaged public var admin: Bool
    
    /* Whether the user is the owner / creator of this lock. There can only be one owner per lock, the user which setup the lock. */
    @NSManaged public var owner: Bool
    
    // MARK: Relationships
    
    /* The lock this permission is granting access for. */
    @NSManaged public var lock: Lock
    
    /* The user this permssion is granting access to. */
    @NSManaged public var user: User
    
    /* Permissions derived from this permission. */
    @NSManaged public var derivedPermissions: Set<Permission>?
    
    /* Permission this permission was derived from. */
    @NSManaged public var parentPermission: Permission?
    
    /* Actions involving this permission. */
    @NSManaged public var actions: Set<Action>?
    
    // MARK: - Custom Accessors
    
    public var isArchived: Bool {
        
        return self.archived.boolValue
    }
}
