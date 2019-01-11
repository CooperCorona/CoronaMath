//
//  PointBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/22/18.
//

import Foundation

///A 2-dimensional vector.
public struct PointBase<VectorType> where VectorType: Addable {

    ///The number of components in a `PointBase` instance.
    public static var numberOfComponents: Int { return 2 }

    ///The values of this vector.
    public private(set) var components = [VectorType](repeating: VectorType.zero, count: PointBase.numberOfComponents)
    
    ///The x coordinate of the `PointBase` (the first component of the vector).
    public var x:VectorType {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The y coordinate of the `PointBase` (the second component of the vector).
    public var y:VectorType {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }

    ///Initializes the zero point.
    public init() {}

    ///Initializes a `PointBase` with the given values.
    /// - parameter x: The first component of the vector.
    /// - parameter y: The second component of the vector.
    public init(x:VectorType, y:VectorType) {
        self.components = [x, y]
    }

    ///Initializes a `PointBase` with the given value for `x`. The `y` component is set to `VectorType.zero`.
    /// - parameter x: The first component of the vector.
    public init(x:VectorType) {
        self.components = [x, VectorType.zero]
    }

    ///Initializes a `PointBase` with the given value for `y`. The `x` component is set to `VectorType.zero`.
    /// - parameter y: The second component of the vector.
    public init(y:VectorType) {
        self.components = [VectorType.zero, y]
    }

    ///Initializes a `PointBase` with the given value for `x` and `y`.
    /// - parameter xy: The value of both components of the vector.
    public init(xy:VectorType) {
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
    
}

extension PointBase where VectorType: Numeric & Multiplicable {

    ///The unit vector in the x direction.
    public static var unitX:PointBase<VectorType> { return PointBase<VectorType>(components: [VectorType.one, VectorType.zero]) }
    ///The unit vector in the y direction.
    public static var unitY:PointBase<VectorType> { return PointBase<VectorType>(components: [VectorType.zero, VectorType.one]) }
}

extension PointBase: Addable where VectorType: Numeric & Addable {}
extension PointBase: Equatable where VectorType: Equatable {}
extension PointBase: VectorBase where VectorType: Numeric {}
extension PointBase: ConstantSizeVector where VectorType: Numeric {}
extension PointBase: SignedVectorBase where VectorType: SignedNumeric {}
extension PointBase: FloatingPointVector where VectorType: FloatingPoint {}
extension PointBase: ConstantSizeFloatingPointVector where VectorType: FloatingPoint {}

extension PointBase where VectorType == Double {

    ///Calculates the angle of this vector relative to the x-axis.
    /// - returns: The angle this vector makes with the x-axis when
    ///positioned at the origin.
    public func angle() -> VectorType {
        return atan2(self.y, self.x)
    }

    ///Calculates the angle between this vector and `vector`.
    ///
    ///Conceptually, rotating this vector by the return value of this method
    ///results in a vector parallel to `vector`.
    /// - parameter vector: The vector to calculate the angle to.
    /// - returns: The angle between this vector and `vector` in the range [-pi, pi].
    public func angle(to vector:PointBase<VectorType>) -> VectorType {
        return atan2(vector.y - self.y, vector.x - self.x)
    }

}
