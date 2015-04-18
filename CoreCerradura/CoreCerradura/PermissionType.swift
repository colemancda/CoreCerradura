//
//  PermissionType.swift
//  CoreCerradura
//
//  Created by Alsey Coleman Miller on 4/18/15.
//  Copyright (c) 2015 ColemanCDA. All rights reserved.
//

/* Specifies the type of permission. */
public enum PermissionType: String {
    
    /* Lock's owner, there can only be one owner per lock. */
    public case Owner = "owner"
    
    /* Admin of lock. Admin´s are not owners but can grant keys and have most of the owner's priviledges. */
    public case Admin = "admin"
    
    /* Permanent permission. Permission granted by owner / admin indefinitely. Users with permanent permission cannot grant permission to other users. */
    public case Permanent = "permanent"
    
    /* Guest permission. Permission granted by owner / admin for a specified amount of time. Users with permanent permission cannot grant permission to other users. */
    public case Guest = "guest"
}