//
//  AssociatedObject.swift
//  AssociatedObject
//
//  Created by Sergej Jaskiewicz on 17.07.16.
//  Copyright © 2016 Sergej Jaskiewicz. All rights reserved.
//

public final class AssociatedObject {
    
    private typealias Address = UnsafePointer<Void>
    
    private static var associatedObjects = [Address : Retainer]()
    
    public static func set<T>(for instance: AnyObject, forKey key: String, value: T) {
        
        let addressOfInstance: Address = unsafeAddressOf(instance)
        
        if associatedObjects[addressOfInstance] == nil {
            associatedObjects[addressOfInstance] = Retainer()
        }
        
        associatedObjects[addressOfInstance]!.host = instance
        associatedObjects[addressOfInstance]!.properties[key] = value
    }
    
    public static func get<T>(for instance: AnyObject, forKey key: String) -> T? {
        
        let addressOfInstance: Address = unsafeAddressOf(instance)
        
        return associatedObjects[addressOfInstance]?.properties[key] as? T
    }
}
