//
//  Action.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CoreData

public class Action: NSManagedObject {

    public @NSManaged var date: NSDate
    public @NSManaged var type: String
    public @NSManaged var lock: Lock
    public @NSManaged var user: User
    
}
