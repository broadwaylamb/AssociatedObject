//
//  Retainer.swift
//  AssociatedObject
//
//  Created by Sergej Jaskiewicz on 17.07.16.
//  Copyright © 2016 Sergej Jaskiewicz. All rights reserved.
//

internal final class Retainer {
    
    internal weak var host: AnyObject?
    
    internal var properties = [String : Any]()
    
}
