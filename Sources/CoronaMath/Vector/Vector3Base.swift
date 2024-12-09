//
//  Vector3Base.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import Foundation

/// Statically initialize this because it is commonly accessed. Constructing new instances
/// decreases performance by up to 40%.
private let Vector3BaseDimensions = IntSize(rows: 3, columns: 1)

///A 3-dimensional vector.
public struct Vector3Base<VectorType>: ConstantSizeVector, FastInitializableVector,
    CustomStringConvertible
where VectorType: DiscreteNumber {

    public typealias ComponentType = VectorType

    // MARK: - Static Properties

    #if swift(>=4.2)
        ///The number of components in a `Vector3Base` instance.
        public static var numberOfComponents: Int { return 3 }

        public static var dimensions: IntSize { return Vector3BaseDimensions }

        // MARK: - Instance Properties

        ///The values of this vector.
        public private(set) var components = [VectorType](
            repeating: VectorType.zero, count: Vector3Base<VectorType>.numberOfComponents)
    #else
        ///The number of components in a `Vector3Base` instance.
        public static var staticNumberOfComponents: Int { return 3 }

        public static var dimensions: IntSize { return Vector3BaseDimensions }

        ///The values of this vector.
        public private(set) var components = [VectorType](
            repeating: VectorType.zero, count: Vector3Base<VectorType>.staticNumberOfComponents)
    #endif

    ///The unit vector in the x direction.
    public static var unitX: Vector3Base<VectorType> {
        return Vector3Base<VectorType>(components: [
            VectorType.one, VectorType.zero, VectorType.zero,
        ])
    }
    ///The unit vector in the y direction.
    public static var unitY: Vector3Base<VectorType> {
        return Vector3Base<VectorType>(components: [
            VectorType.zero, VectorType.one, VectorType.zero,
        ])
    }
    ///The unit vector in the z direction.
    public static var unitZ: Vector3Base<VectorType> {
        return Vector3Base<VectorType>(components: [
            VectorType.zero, VectorType.zero, VectorType.one,
        ])
    }

    ///The x coordinate of the vector (the first component).
    public var x: VectorType {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The y coordinate of the vector (the second component).
    public var y: VectorType {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }
    ///The z coordinate of the vector (the third component).
    public var z: VectorType {
        get { return self.components[2] }
        set { self.components[2] = newValue }
    }

    public var description: String { return "(x=\(x), y=\(y), z=\(z))" }

    ///Initializes the zero vector.
    public init() {}

    ///Initializes a `VectorBase` with the given values.
    /// - parameter x: The first component of the vector.
    /// - parameter y: The second component of the vector.
    /// - parameter z: The third component of the vector.
    public init(x: VectorType, y: VectorType, z: VectorType) {
        self.components = [x, y, z]
    }

    ///Initializes a `Vector3Base` with the given components. The caller
    ///is responsible for ensuring `exactComponents` has the correct number of values.
    internal init(exactComponents: [VectorType]) {
        self.components = exactComponents
    }

    ///Provides access to the underlying components of this instance.
    /// - parameter index: The index of the component to access.
    /// - returns: The component at the given index.
    public subscript(index: Int) -> VectorType {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }

    ///Calculates the cross product of this vector and another vector.
    /// - parameter vector: The vector with which to perform the cross product.
    /// - returns: The cross product. This is a vector perpendicular to *self* and
    /// *vector* with length ||self| * |vector| * sin(angle between self and vector)|.
    public func cross(vector: Vector3Base) -> Vector3Base {
        let x = self.y * vector.z - self.z * vector.y
        let y = self.z * vector.x - self.x * vector.z
        let z = self.x * vector.y - self.y * vector.x
        return Vector3Base(components: [x, y, z])
    }
}

extension Vector3Base: ContinuousVector, ConstantSizeContinuousVector
where VectorType: ContinuousNumber {}
extension Vector3Base: Hashable where VectorType: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.components)
    }
}
extension Vector3Base: Sendable where VectorType: Sendable {}

public func * (lhs: Matrix3Base<Float>, rhs: Vector3Base<Float>) -> Vector3Base<Float> {
    // fastMultiply throws only if the matrix and vector dimensions are mismatched.
    // We know they are correct, so it is safe to force try.
    return try! fastMultiply(matrix: lhs, vector: rhs)
}

public func * (lhs: Matrix3Base<Double>, rhs: Vector3Base<Double>) -> Vector3Base<Double> {
    return try! fastMultiply(matrix: lhs, vector: rhs)
}

private enum Vector3BaseCodingKeys: CodingKey {
    case x
    case y
    case z
}

extension Vector3Base: Decodable where VectorType: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Vector3BaseCodingKeys.self)
        let x = try container.decode(VectorType.self, forKey: .x)
        let y = try container.decode(VectorType.self, forKey: .y)
        let z = try container.decode(VectorType.self, forKey: .z)
        self.init(x: x, y: y, z: z)
    }
}

extension Vector3Base: Encodable where VectorType: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: Vector3BaseCodingKeys.self)
        try container.encode(self.x, forKey: .x)
        try container.encode(self.y, forKey: .y)
        try container.encode(self.z, forKey: .z)
    }
}
