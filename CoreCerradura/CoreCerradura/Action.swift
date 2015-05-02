//
//  Action.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CoreData

/* Encapsulates an action. Used for activity history. */
public class Action: NSManagedObject {
    
    // MARK: - Properties
    
    // MARK: Attributes

    /* Date this action ocurred. */
    @NSManaged public var date: NSDate
    
    /* Type of action. Raw value of ActionType. */
    @NSManaged public var type: String
    
    // MARK: Relationships
    
    /* The lock associated with this action. */
    @NSManaged public var lock: Lock?
    
    /* The user associated with this action. */
    @NSManaged public var user: User?
    
    /* The permission associated with this action. */
    @NSManaged public var permission: Permission?
    
    // MARK: - Initialization
    
    public override func awakeFromInsert() {
        
        self.date = NSDate()
    }
}

// MARK: - Enumerations

/* Specifies the type of action. */
public enum ActionType: String {
    
    /* A new entity was created. */
    case New = "new"
    
    /* An entity has been archived / invalidated. */
    case Archived = "archived"
    
    /* A lock was unlocked. */
    case Unlocked = "unlocked"
}