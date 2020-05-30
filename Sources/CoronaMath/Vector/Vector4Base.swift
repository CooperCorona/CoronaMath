//
//  Vector4Base.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

///A 4-dimensional vector.
public struct Vector4Base<VectorType>: ConstantSizeVector where VectorType: DiscreteNumber {

    public typealias ComponentType = VectorType

    // MARK: - Static Properties

    #if swift(>=4.2)
    ///The number of components in a `Vector4Base` instance.
    public static var numberOfComponents:Int { return 4 }

    // MARK: - Instance Properties

    ///The values of the vector.
    public private(set) var components: [VectorType] = [VectorType](repeating: VectorType.zero, count: Vector4Base.numberOfComponents)
    #else
    ///The number of components in a `Vector4Base` instance.
    public static var staticNumberOfComponents:Int { return 4 }

    ///The values of the vector.
    public private(set) var components: [VectorType] = [VectorType](repeating: VectorType.zero, count: Vector4Base.staticNumberOfComponents)
    #endif

    ///The unit vector in the x direction.
    public static var unitX:Vector4Base<VectorType> { return Vector4Base<VectorType>(components: [VectorType.one, VectorType.zero, VectorType.zero, VectorType.zero]) }
    ///The unit vector in the y direction.
    public static var unitY:Vector4Base<VectorType> { return Vector4Base<VectorType>(components: [VectorType.zero, VectorType.one, VectorType.zero, VectorType.zero]) }
    ///The unit vector in the z direction.
    public static var unitZ:Vector4Base<VectorType> { return Vector4Base<VectorType>(components: [VectorType.zero, VectorType.zero, VectorType.one, VectorType.zero]) }
    ///The unit vector in the w direction.
    public static var unitW:Vector4Base<VectorType> { return Vector4Base<VectorType>(components: [VectorType.zero, VectorType.zero, VectorType.zero, VectorType.one]) }
    
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
    ///The w coordinate of the vector (the fourth component).
    public var w:VectorType {
        get { return self.components[3] }
        set { self.components[3] = newValue }
    }

    ///Initializse the zero vector.
    public init() {}

    ///Initializes a `VectorBase` with the given values.
    /// - parameter x: The first component of the vector.
    /// - parameter y: The second component of the vector.
    /// - parameter z: The third component of the vector.
    /// - parameter w: The fourth component of the vector.
    public init(x:VectorType, y:VectorType, z:VectorType, w:VectorType) {
        self.components = [x, y, z, w]
    }

    ///Provides access to the underlying components of this instance.
    /// - parameter index: The index of the component to access.
    /// - returns: The component at the given index.
    public subscript(index:Int) -> VectorType {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }
    
}

extension Vector4Base: ContinuousVector, ConstantSizeContinuousVector where VectorType: ContinuousNumber {}

public func *(lhs:Matrix4Base<Float>, rhs:Vector4Base<Float>) -> Vector4Base<Float> {
    // fastMultiply throws only if the matrix and vector dimensions are mismatched.
    // We know they are correct, so it is safe to force try.
    return try! fastMultiply(matrix: lhs, vector: rhs)
}

public func *(lhs:Matrix4Base<Double>, rhs:Vector4Base<Double>) -> Vector4Base<Double> {
    return try! fastMultiply(matrix: lhs, vector: rhs)
}

fileprivate enum Vector4BaseCodingKeys: CodingKey {
    case x
    case y
    case z
    case w
}

extension Vector4Base: Decodable where VectorType: Decodable {
    public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: Vector4BaseCodingKeys.self)
        let x = try container.decode(VectorType.self, forKey: .x)
        let y = try container.decode(VectorType.self, forKey: .y)
        let z = try container.decode(VectorType.self, forKey: .z)
        let w = try container.decode(VectorType.self, forKey: .w)
        self.init(x: x, y: y, z: z, w: w)
    }
}

extension Vector4Base: Encodable where VectorType: Encodable {
    public func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: Vector4BaseCodingKeys.self)
        try container.encode(self.x, forKey: .x)
        try container.encode(self.y, forKey: .y)
        try container.encode(self.z, forKey: .z)
        try container.encode(self.w, forKey: .w)
    }
}
