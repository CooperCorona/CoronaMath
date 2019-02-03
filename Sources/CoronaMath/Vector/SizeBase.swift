//
//  SizeBase.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/8/19.
//

import Foundation

///A 2-dimensional vector representing a size.
public struct SizeBase<VectorType> where VectorType: Addable {

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

}

extension SizeBase where VectorType: Numeric & Multiplicable {

    ///The unit vector in the width direction.
    public static var unitWidth:SizeBase<VectorType> { return SizeBase<VectorType>(components: [VectorType.one, VectorType.zero]) }
    ///The unit vector in the height direction.
    public static var unitHeight:SizeBase<VectorType> { return SizeBase<VectorType>(components: [VectorType.zero, VectorType.one]) }
}

extension SizeBase: Addable where VectorType: Numeric & Addable {}
extension SizeBase: Equatable where VectorType: Numeric {}
extension SizeBase: VectorBase where VectorType: Numeric {}
extension SizeBase: ConstantSizeVector where VectorType: Numeric {}
extension SizeBase: SignedVectorBase where VectorType: SignedNumeric {}
extension SizeBase: FloatingPointVector where VectorType: FloatingPoint {}
extension SizeBase: ConstantSizeFloatingPointVector where VectorType: FloatingPoint {}

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
