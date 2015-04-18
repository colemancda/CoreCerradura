//
//  ActionType.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

/* Specifies the type of action. */
public enum ActionType: String {
    
    /* A new entity was created. */
    public case New = "new"
    
    /* An entity has been archived / invalidated. */
    public case Archived = "archived"
    
    /* A lock was unlocked. */
    public case Unlocked = "unlocked"
}