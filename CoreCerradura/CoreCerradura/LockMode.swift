//
//  LockMode.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 6/21/15.
//  Copyright © 2015 ColemanCDA. All rights reserved.
//

/** Modes for the lock device. */
public enum LockMode: String {
    
    /** The lock device is in setup mode. */
    case Setup = "Setup"
    
    /** The lock device is in command reciever mode. */
    case CommandReceiver = "CommandReceiver"
    
    /** The lock device is in fatal error mode. */
    case FatalError = "FatalError"
}