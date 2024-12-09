//
//  PointBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

///A 2-dimensional vector.
public struct PointBase<VectorType>: ConstantSizeVector, CustomStringConvertible
where VectorType: DiscreteNumber {

    public typealias ComponentType = VectorType

    #if swift(>=4.2)
        ///The number of components in a `PointBase` instance.
        public static var numberOfComponents: Int { return 2 }

        ///The values of this vector.
        public private(set) var components = [VectorType](
            repeating: VectorType.zero, count: PointBase.numberOfComponents)
    #else
        ///The number of components in a `PointBase` instance.
        public static var staticNumberOfComponents: Int { return 2 }

        public private(set) var components = [VectorType](
            repeating: VectorType.zero, count: PointBase.staticNumberOfComponents)
    #endif

    ///The unit vector in the x direction.
    public static var unitX: PointBase<VectorType> {
        return PointBase<VectorType>(components: [VectorType.one, VectorType.zero])
    }
    ///The unit vector in the y direction.
    public static var unitY: PointBase<VectorType> {
        return PointBase<VectorType>(components: [VectorType.zero, VectorType.one])
    }

    ///The x coordinate of the `PointBase` (the first component of the vector).
    public var x: VectorType {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The y coordinate of the `PointBase` (the second component of the vector).
    public var y: VectorType {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }

    public var description: String { return "(x=\(x), y=\(y))" }

    ///Initializes the zero point.
    public init() {}

    ///Initializes a `PointBase` with the given values.
    /// - parameter x: The first component of the vector.
    /// - parameter y: The second component of the vector.
    public init(x: VectorType, y: VectorType) {
        self.components = [x, y]
    }

    ///Initializes a `PointBase` with the given value for `x`. The `y` component is set to `VectorType.zero`.
    /// - parameter x: The first component of the vector.
    public init(x: VectorType) {
        self.components = [x, VectorType.zero]
    }

    ///Initializes a `PointBase` with the given value for `y`. The `x` component is set to `VectorType.zero`.
    /// - parameter y: The second component of the vector.
    public init(y: VectorType) {
        self.components = [VectorType.zero, y]
    }

    ///Initializes a `PointBase` with the given value for `x` and `y`.
    /// - parameter xy: The value of both components of the vector.
    public init(xy: VectorType) {
        self.components = [xy, xy]
    }

    ///Provides access to the underlying components of this instance.
    /// - parameter index: The index of the component to access.
    /// - returns: The component at the given index.
    public subscript(index: Int) -> VectorType {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }

    ///Returns a `PointBase` with flipped components, so `x` becomes `y` and vice versa.
    /// - returns: A `PointBase` instance whose `x` is this instance's `y` and vice versa.
    public func flip() -> PointBase<VectorType> {
        return PointBase(x: self.y, y: self.x)
    }

    ///Returns a `SizeBase` instance with the same components as this instance.
    public func size() -> SizeBase<VectorType> {
        return SizeBase(width: self.x, height: self.y)
    }

}

extension PointBase: ContinuousVector where VectorType: ContinuousNumber {}
extension PointBase: ConstantSizeContinuousVector where VectorType: ContinuousNumber {}
extension PointBase: Hashable where VectorType: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.components)
    }
}

extension PointBase where VectorType: ContinuousNumber {

    ///Initializes a point representing a vector starting at the origin with an angle of `angle` and a length of `length`.
    /// - parameter angle: The angle of the end of this vector from the origin.
    /// - parameter length: The length of the vector. Optional. Defaults to 1 for a point on the unit circle.
    public init(angle: VectorType, length: VectorType = VectorType.one) {
        let x = VectorType.cos(angle) * length
        let y = VectorType.sin(angle) * length
        self.init(x: x, y: y)
    }

    ///Calculates the angle of this vector relative to the x-axis.
    /// - returns: The angle this vector makes with the x-axis when
    ///positioned at the origin.
    public func angle() -> VectorType {
        return VectorType.atan2(self.y, self.x)
    }

    ///Calculates the angle of the vector starting at `self` and ending at `vector`, assuming
    ///both vectors are positioned at the origin.
    /// - parameter vector: The vector to calculate the angle to.
    /// - returns: The angle between this vector and `vector` in the range [-pi, pi].
    public func angle(to vector: PointBase<VectorType>) -> VectorType {
        return VectorType.atan2(vector.y - self.y, vector.x - self.x)
    }

}

///Multiplies a matrix times a point, treating a point as a vector with z-component `1.0`, then dropping the z-component in the return value.
public func * (lhs: Matrix3Base<Float>, rhs: PointBase<Float>) -> PointBase<Float> {
    let vector = lhs * Vector3Base(x: rhs.x, y: rhs.y, z: 1.0)
    return PointBase(x: vector.x, y: vector.y)
}

public func * (lhs: Matrix3Base<Double>, rhs: PointBase<Double>) -> PointBase<Double> {
    let vector = lhs * Vector3Base(x: rhs.x, y: rhs.y, z: 1.0)
    return PointBase(x: vector.x, y: vector.y)
}

private enum PointBaseCodingKeys: CodingKey {
    case x
    case y
}

extension PointBase: Decodable where VectorType: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PointBaseCodingKeys.self)
        let x = try container.decode(VectorType.self, forKey: .x)
        let y = try container.decode(VectorType.self, forKey: .y)
        self.init(x: x, y: y)
    }
}

extension PointBase: Encodable where VectorType: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: PointBaseCodingKeys.self)
        try container.encode(self.x, forKey: .x)
        try container.encode(self.y, forKey: .y)
    }
}

extension PointBase: Sendable where VectorType: Sendable {}

public func + <VectorType>(lhs: PointBase<VectorType>, rhs: SizeBase<VectorType>) -> PointBase<
    VectorType
> {
    return PointBase(x: lhs.x + rhs.width, y: lhs.y + rhs.height)
}

public func - <VectorType>(lhs: PointBase<VectorType>, rhs: SizeBase<VectorType>) -> PointBase<
    VectorType
> {
    return PointBase(x: lhs.x - rhs.width, y: lhs.y - rhs.height)
}

public func * <VectorType>(lhs: PointBase<VectorType>, rhs: SizeBase<VectorType>) -> PointBase<
    VectorType
> {
    return PointBase(x: lhs.x * rhs.width, y: lhs.y * rhs.height)
}

public func / <VectorType: ContinuousNumber>(lhs: PointBase<VectorType>, rhs: SizeBase<VectorType>)
    -> PointBase<VectorType>
{
    return PointBase(x: lhs.x / rhs.width, y: lhs.y / rhs.height)
}
