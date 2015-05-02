//
//  LockCommand.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 5/2/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CoreData

/** Encapsulates a pending command to the lock. */
public class LockCommand: NSManagedObject {
    
    // MARK: - Properties
    
    // MARK: Attributes

    /** Date the command was issued. */
    @NSManaged public var date: NSDate
    
    /** Command type. Raw value for LockCommandType. */
    @NSManaged public var command: String
    
    // MARK: Relationships
    
    /** The lock this command is intended for. */
    @NSManaged public var lock: Lock
    
    // MARK: - Methods
    
    public override func awakeFromInsert() {
        
        self.date = NSDate()
    }
}

// MARK: - Enumerations

public enum LockCommandType: String {
    
    case Unlock = "unlock"
    
    case Update = "update"
}

