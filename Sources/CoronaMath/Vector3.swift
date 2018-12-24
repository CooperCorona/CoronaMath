//
//  Vector3.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///A 3-dimensional vector.
public struct Vector3: Vector {
    
    public static let numberOfComponents = 3
    
    public private(set) var components: [Double] = [Double](repeating: 0.0, count: Vector3.numberOfComponents)
    
    ///The x coordinate of the vector (the first component).
    public var x:Double {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The y coordinate of the vector (the second component).
    public var y:Double {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }
    ///The z coordinate of the vector (the third component).
    public var z:Double {
        get { return self.components[2] }
        set { self.components[2] = newValue }
    }
    
    public init() {}
    
    public subscript(index:Int) -> Double {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }
    
}
