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
public class Lock: NSManagedObject, Archivable {
    
    // MARK: - Properties
    
    // MARK: Attributes

    /* Whether this entity is archived or not. Archived entities are basically deleted, but still stored for historical purposes. */
    @NSManaged public var archived: NSNumber
    
    /* Date the lock was created. */
    @NSManaged public var created: NSDate
    
    /* The lock´s secret. Only the owner can see this. */
    @NSManaged public var secret: String
    
    /* The model of the lock. Raw value for LockModel. */
    @NSManaged public var model: String
    
    /* The version of the software currently on the lock. */
    @NSManaged public var version: String?
    
    /** The lock is currently updating its software. */
    @NSManaged public var updating: NSNumber
    
    // MARK: Relationships
    
    /* Actions involving this lock. */
    @NSManaged public var actions: Set<Action>?
    
    /* Permissions granted for this lock. */
    @NSManaged public var permissions: Set<Permission>?
    
    /** Pending commands for the lock. Only used by server. Clients never recieve this info. */
    @NSManaged public var pendingCommands: Set<LockCommand>?
    
    // MARK: - Initialization
    
    public override func awakeFromInsert() {
        
        self.created = NSDate()
    }
    
    // MARK: - Archiveable
    
    public func didArchive() {
        
        
    }
}

// MARK: - Enumerations

public enum LockModel: String {
    
    case Edison = "Edison"
}

