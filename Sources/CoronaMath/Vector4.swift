//
//  Vector4.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///A 4-dimensional vector.
public struct Vector4: Vector {
    
    ///The vector with 0 for all components.
    public static let Zero = Vector3(components: [0.0, 0.0, 0.0, 0.0])
    ///The unit vector in the x direction.
    public static let X = Vector4(components: [1.0, 0.0, 0.0, 0.0])
    ///The unit vector in the y direction.
    public static let Y = Vector4(components: [0.0, 1.0, 0.0, 0.0])
    ///The unit vector in the z direction.
    public static let Z = Vector4(components: [0.0, 0.0, 1.0, 0.0])
    ///The unit vector in the w direction.
    public static let W = Vector4(components: [0.0, 0.0, 0.0, 1.0])
    
    public static let numberOfComponents = 4
    
    public private(set) var components: [Double] = [Double](repeating: 0.0, count: Vector4.numberOfComponents)
    
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
    ///The w coordinate of the vector (the fourth component).
    public var w:Double {
        get { return self.components[3] }
        set { self.components[3] = newValue }
    }
    
    public init() {}
    
    public init(x:Double, y:Double, z:Double, w:Double) {
        self.components = [x, y, z, w]
    }
    
    public subscript(index:Int) -> Double {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }
    
}
