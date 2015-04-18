//
//  ActionType.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

/* Specifies the type of action. */
public enum ActionType: String {
    
    /* A new lock / user / permission was created. */
    public case New = "new"
    
    /* A lock was unlocked. */
    public case Unlocked = "unlocked"
}