//
//  Vector3Base.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///A 3-dimensional vector.
public struct Vector3Base<VectorType> where VectorType: Addable {

    // MARK: - Static Properties
    
    ///The number of components in a `Vector3Base` instance.
    public static var numberOfComponents:Int { return 3 }

    // MARK: - Instance Properties

    ///The values of this vector.
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

    ///Initializes the zero vector.
    public init() {}

    ///Initializes a `VectorBase` with the given values.
    /// - parameter x: The first component of the vector.
    /// - parameter y: The second component of the vector.
    /// - parameter z: The third component of the vector.
    public init(x:VectorType, y:VectorType, z:VectorType) {
        self.components = [x, y, z]
    }

    ///Provides access to the underlying components of this instance.
    /// - parameter index: The index of the component to access.
    /// - returns: The component at the given index.
    public subscript(index:Int) -> VectorType {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }
    
}

extension Vector3Base where VectorType: Numeric & Multiplicable {

    ///The unit vector in the x direction.
    public static var unitX:Vector3Base<VectorType> { return Vector3Base<VectorType>(components: [VectorType.one, VectorType.zero, VectorType.zero]) }
    ///The unit vector in the y direction.
    public static var unitY:Vector3Base<VectorType> { return Vector3Base<VectorType>(components: [VectorType.zero, VectorType.one, VectorType.zero]) }
    ///The unit vector in the z direction.
    public static var unitZ:Vector3Base<VectorType> { return Vector3Base<VectorType>(components: [VectorType.zero, VectorType.zero, VectorType.one]) }
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
extension Vector3Base: ConstantSizeVector where VectorType: Numeric {}
extension Vector3Base: SignedVectorBase where VectorType: SignedNumeric {}
extension Vector3Base: FloatingPointVector where VectorType: FloatingPoint {}
extension Vector3Base: ConstantSizeFloatingPointVector where VectorType: FloatingPoint {}
