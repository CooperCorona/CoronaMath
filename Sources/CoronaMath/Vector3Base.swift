//
//  Vector3Base.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///A 3-dimensional vector.
public struct Vector3Base<VectorType> where VectorType: Addable {
    
    ///The unit vector in the x direction.
    public static var x:Vector3Base<Double> { return Vector3Base<Double>(components: [1.0, 0.0, 0.0]) }
    ///The unit vector in the y direction.
    public static var y:Vector3Base<Double> { return Vector3Base<Double>(components: [0.0, 1.0, 0.0]) }
    ///The unit vector in the z direction.
    public static var z:Vector3Base<Double> { return Vector3Base<Double>(components: [0.0, 0.0, 1.0]) }
    
    public static var numberOfComponents:Int { return 3 }
    
    public private(set) var components = [VectorType](repeating: VectorType.zero, count: Vector3Base<VectorType>.numberOfComponents)

    ///The x coordinate of the vector (the first component).
    public var x:VectorType {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The y coordinate of the vector (the second component).
    public var y:VectorType {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }
    ///The z coordinate of the vector (the third component).
    public var z:VectorType {
        get { return self.components[2] }
        set { self.components[2] = newValue }
    }
    
    public init() {}
    
    public init(x:VectorType, y:VectorType, z:VectorType) {
        self.components = [x, y, z]
    }
    
    public subscript(index:Int) -> VectorType {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }
    
}

extension Vector3Base: Addable where VectorType: Numeric {}
extension Vector3Base: Equatable where VectorType: Numeric {}
extension Vector3Base: VectorBase where VectorType: Numeric {
    ///Calculates the cross product of this vector and another vector.
    /// - parameter vector: The vector with which to perform the cross product.
    /// - returns: The cross product. This is a vector perpendicular to *self* and
    /// *vector* with length ||self| * |vector| * sin(angle between self and vector)|.
    public func cross(vector:Vector3Base) -> Vector3Base {
        let x = self.y * vector.z - self.z * vector.y
        let y = self.z * vector.x - self.x * vector.z
        let z = self.x * vector.y - self.y * vector.x
        return Vector3Base(components: [x, y, z])
    }
}
extension Vector3Base: SignedVectorBase where VectorType: SignedNumeric {}
extension Vector3Base: FloatingPointVector where VectorType: FloatingPoint {}
