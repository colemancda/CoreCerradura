//
//  Lock.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

import Foundation
import CoreData

public class Lock: NSManagedObject {

    public @NSManaged var archived: NSNumber
    public @NSManaged var created: NSDate
    public @NSManaged var online: NSNumber
    public @NSManaged var secret: String
    public @NSManaged var actions: NSSet
    public @NSManaged var permissions: NSSet

}
