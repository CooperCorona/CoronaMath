//
//  Vector3.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///A 3-dimensional vector.
public struct Vector3: Vector {
    
    ///The vector with 0 for all components.
    public static let Zero = Vector3(components: [0.0, 0.0, 0.0])
    ///The unit vector in the x direction.
    public static let X = Vector3(components: [1.0, 0.0, 0.0])
    ///The unit vector in the y direction.
    public static let Y = Vector3(components: [0.0, 1.0, 0.0])
    ///The unit vector in the z direction.
    public static let Z = Vector3(components: [0.0, 0.0, 1.0])
    
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
    
    public init(x:Double, y:Double, z:Double) {
        self.components = [x, y, z]
    }
    
    public subscript(index:Int) -> Double {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }
    
    ///Calculates the cross product of this vector and another vector.
    /// - parameter vector: The vector with which to perform the cross product.
    /// - returns: The cross product. This is a vector perpendicular to *self* and
    /// *vector* with length ||self| * |vector| * sin(angle between self and vector)|.
    public func cross(vector:Vector3) -> Vector3 {
        let x = self.y * vector.z - self.z * vector.y
        let y = self.z * vector.x - self.x * vector.z
        let z = self.x * vector.y - self.y * vector.x
        return Vector3(components: [x, y, z])
    }
    
}
