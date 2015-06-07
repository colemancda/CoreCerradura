//
//  Action.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CoreData

/** Encapsulates an action. Used for activity history. */
public class Action: NSManagedObject {
    
    // MARK: - Properties
    
    // MARK: Attributes

    /** Date this action ocurred. */
    @NSManaged public var date: NSDate
    
    /** Type of action. Raw value of ActionType. */
    @NSManaged public var type: String
    
    /** Status the action has been completed. Raw value of ActionStatus. */
    @NSManaged public var status: String
    
    // MARK: Relationships
    
    /** The lock associated with this action. */
    @NSManaged public var lock: Lock?
    
    /** The user associated with this action. */
    @NSManaged public var user: User?
    
    /** The permission associated with this action. */
    @NSManaged public var permission: Permission?
    
    // MARK: - Initialization
    
    public override func awakeFromInsert() {
        
        self.date = NSDate()
        
        self.status = ActionStatus.Completed.rawValue
    }
    
    // MARK: - Validation
    
    public func validateType(ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>, error outError: NSErrorPointer) -> Bool {
        
        let rawValue = ioValue.memory as! ActionType.RawValue
        
        return (ActionType(rawValue: rawValue) != nil)
    }
    
    public func validateStatus(ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>, error outError: NSErrorPointer) -> Bool {
        
        let rawValue = ioValue.memory as! ActionStatus.RawValue
        
        return (ActionStatus(rawValue: rawValue) != nil)
    }
}

// MARK: - Enumerations

/** Specifies the type of action. */
public enum ActionType: String {
    
    /** A new entity was created. */
    case New = "new"
    
    /** An entity has been archived / invalidated. */
    case Archived = "archived"
    
    /** A lock was unlocked. */
    case Unlock = "unlock"
}

/** Specifies the status of the action. */
public enum ActionStatus: String {
    
    /** Action completed. Default value. */
    case Completed = "completed"
    
    /** Action is pending completion. */
    case Pending = "pending"
    
    /** Action expired. */
    case Expired = "expired"
}
