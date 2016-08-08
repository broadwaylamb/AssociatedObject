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
    
    public static func set<Value>(for instance: AnyObject, forKey key: String, value: Value) {
        
        let addressOfInstance: Address = unsafeAddress(of: instance)
        
        if associatedObjects[addressOfInstance] == nil {
            associatedObjects[addressOfInstance] = Retainer()
        }
        
        associatedObjects[addressOfInstance]!.host = instance
        associatedObjects[addressOfInstance]!.properties[key] = value
    }
    
    public static func get<Value>(for instance: AnyObject, forKey key: String) -> Value? {
        
        let addressOfInstance: Address = unsafeAddress(of: instance)
        
        return associatedObjects[addressOfInstance]?.properties[key] as? Value
    }
}
