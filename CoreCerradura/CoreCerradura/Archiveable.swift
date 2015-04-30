//
//  Archiveable.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/20/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

/** Protocol that defines whether an entity can be archived or not. Archived entities are basically deleted, but still stored for historical purposes. */
public protocol Archiveable {
    
    /* Whether this entity is archived or not. Archived entities are basically deleted, but still stored for historical purposes. */
    var archived: NSNumber { get set }
}

public let ArchiveFunctionName = "archive"