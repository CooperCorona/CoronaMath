//
//  SizeBase.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/8/19.
//

import Foundation

///A 2-dimensional vector representing a size.
public struct SizeBase<VectorType>: ConstantSizeVector, CustomStringConvertible where VectorType: DiscreteNumber {

    public typealias ComponentType = VectorType

    #if swift(>=4.2)
    ///The number of components in a `SizeBase` instance.
    public static var numberOfComponents: Int { return 2 }

    ///The values of this vector.
    public private(set) var components = [VectorType](repeating: VectorType.zero, count: SizeBase.numberOfComponents)
    #else
    ///The number of components in a `SizeBase` instance.
    public static var staticNumberOfComponents: Int { return 2 }

    ///The values of this vector.
    public private(set) var components = [VectorType](repeating: VectorType.zero, count: SizeBase.staticNumberOfComponents)
    #endif

    ///The width of the `SizeBase` (the first component of the vector).
    public var width:VectorType {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The height of the `SizeBase` (the second component of the vector).
    public var height:VectorType {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }
    
    public var description:String { return "(w=\(width), h=\(height))" }

    ///Initializes the zero size.
    public init() {}

    ///Initializes a `SizeBase` with the given values.
    /// - parameter width: The first component of the vector.
    /// - parameter height: The second component of the vector.
    public init(width:VectorType, height:VectorType) {
        self.components = [width, height]
    }

    ///Initializes a `SizeBase` with the given value for `width`. The `height` component is set to `VectorType.zero`.
    /// - parameter width: The first component of the vector.
    public init(width:VectorType) {
        self.components = [width, VectorType.zero]
    }

    ///Initializes a `SizeBase` with the given value for `height`. The `width` component is set to `VectorType.zero`.
    /// - parameter height: The second component of the vector.
    public init(height:VectorType) {
        self.components = [VectorType.zero, height]
    }

    ///Initializes a `SizeBase` with the given value for `width` and `height`.
    /// - parameter square: The value of both components of the vector.
    public init(square:VectorType) {
        self.components = [square, square]
    }

    ///Provides access to the underlying components of this instance.
    /// - parameter index: The index of the component to access.
    /// - returns: The component at the given index.
    public subscript(index: Int) -> VectorType {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }

    ///Returns a `PointBase` instance with the same components as this instance.
    public func point() -> PointBase<VectorType> {
        return PointBase(x: self.width, y: self.height)
    }

}

extension SizeBase where VectorType: DiscreteNumber {

    ///The unit vector in the width direction.
    public static var unitWidth:SizeBase<VectorType> { return SizeBase<VectorType>(components: [VectorType.one, VectorType.zero]) }
    ///The unit vector in the height direction.
    public static var unitHeight:SizeBase<VectorType> { return SizeBase<VectorType>(components: [VectorType.zero, VectorType.one]) }
}

extension SizeBase: ContinuousVector where VectorType: ContinuousNumber {}
extension SizeBase: ConstantSizeContinuousVector where VectorType: ContinuousNumber {}
extension SizeBase: Hashable where VectorType: Hashable {
    public func hash(into hasher:inout Hasher) {
        hasher.combine(self.components)
    }
}

extension SizeBase where VectorType: Comparable {

    ///Determines if a rect with origin (zero, zero) and size `self` contains the given point.
    /// - parameter point: The given point.
    /// - returns: `true` if the rect with size `self` and origin (zero, zero) contains
    ///`point`, `false` otherwise.
    public func contains(point:PointBase<VectorType>) -> Bool {
        return VectorType.zero <= point.x && point.x <= self.width
            && VectorType.zero <= point.y && point.y <= self.height
    }

}

extension SizeBase where VectorType == Float {

    ///The center of the rectangle with origin `{0, 0}` and size `self`.
    public var center:PointBase<Float> { return PointBase(x: self.width / 2.0, y: self.height / 2.0) }

}

extension SizeBase where VectorType == Double {

    ///The center of the rectangle with origin `{0, 0}` and size `self`.
    public var center:PointBase<Double> { return PointBase(x: self.width / 2.0, y: self.height / 2.0) }

}

fileprivate enum SizeBaseCodingKeys: CodingKey {
    case width
    case height
}

extension SizeBase: Decodable where VectorType: Decodable {
    public init(from decoder:Decoder) throws {
        let container = try decoder.container(keyedBy: SizeBaseCodingKeys.self)
        let width = try container.decode(VectorType.self, forKey: .width)
        let height = try container.decode(VectorType.self, forKey: .height)
        self.init(width: width, height: height)
    }
}

extension SizeBase: Encodable where VectorType: Encodable {
    public func encode(to encoder:Encoder) throws {
        var container = encoder.container(keyedBy: SizeBaseCodingKeys.self)
        try container.encode(self.width, forKey: .width)
        try container.encode(self.height, forKey: .height)
    }
}

extension SizeBase: Sendable where VectorType: Sendable {}

public func +<VectorType>(lhs:SizeBase<VectorType>, rhs:PointBase<VectorType>) -> SizeBase<VectorType> {
    return SizeBase(width: lhs.width + rhs.x, height: lhs.height + rhs.y)
}

public func -<VectorType>(lhs:SizeBase<VectorType>, rhs:PointBase<VectorType>) -> SizeBase<VectorType> {
    return SizeBase(width: lhs.width - rhs.x, height: lhs.height - rhs.y)
}

public func *<VectorType>(lhs:SizeBase<VectorType>, rhs:PointBase<VectorType>) -> SizeBase<VectorType> {
    return SizeBase(width: lhs.width * rhs.x, height: lhs.height * rhs.y)
}

public func /<VectorType: ContinuousNumber>(lhs:SizeBase<VectorType>, rhs:PointBase<VectorType>) -> SizeBase<VectorType> {
    return SizeBase(width: lhs.width / rhs.x, height: lhs.height / rhs.y)
}
