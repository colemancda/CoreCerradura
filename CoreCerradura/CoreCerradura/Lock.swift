//
//  Lock.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CoreData

/* Entity representing an instance of a physical lock. */
public class Lock: NSManagedObject {

    /* Whether this entity is archived or not. Archived entities are basically deleted, but still stored for historical purposes. */
    @NSManaged public var archived: NSNumber
    
    /* Date the lock was created. */
    @NSManaged public var created: NSDate
    
    /* Whether the lock is currently connected to the server. */
    @NSManaged public var online: NSNumber
    
    /* The lock´s secret. Only the owner can see this. */
    @NSManaged public var secret: String
    
    /* Actions involving this lock. */
    @NSManaged public var actions: Set<Action>?
    
    /* Permissions granted for this lock. */
    @NSManaged public var permissions: Set<Permission>?
    
    // MARK: - Custom Accessors
    
    /* Custom accessor for 'archived' attribute. */
    public var isArchived: Bool {
        
        return self.archived.boolValue
    }
    
    /* Custom accessor for 'online' attribute. */
    public var isOnline: Bool {
        
        return self.online.boolValue
    }
}
