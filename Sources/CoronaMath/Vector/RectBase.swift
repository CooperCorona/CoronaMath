//
//  RectBase.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/8/19.
//

import Foundation

///A 4-dimensional vector representing a rectangle. A rectangle contains an origin (point) and dimensions (size).
public struct RectBase<VectorType> where VectorType: Addable {

    // MARK: - Static Properties

    ///The number of components in a `RectBase` instance.
    public static var numberOfComponents:Int { return 4 }

    // MARK: - Instance Properties

    ///The values of the vector.
    public private(set) var components: [VectorType] = [VectorType](repeating: VectorType.zero, count: RectBase.numberOfComponents)

    ///The x coordinate of the origin of the rect (the first component).
    public var x:VectorType {
        get { return self.components[0] }
        set { self.components[0] = newValue }
    }
    ///The y coordinate of the origin of the rect (the second component).
    public var y:VectorType {
        get { return self.components[1] }
        set { self.components[1] = newValue }
    }
    ///The width of the rect (the third component).
    public var width:VectorType {
        get { return self.components[2] }
        set { self.components[2] = newValue }
    }
    ///The height of the rect (the fourth component).
    public var height:VectorType {
        get { return self.components[3] }
        set { self.components[3] = newValue }
    }
    ///The origin of the rect (the first two components).
    public var origin:PointBase<VectorType> {
        get { return PointBase(x: self.x, y: self.y) }
        set {
            self.x = newValue.x
            self.y = newValue.y
        }
    }
    ///The size of the rect (the last two components).
    public var size:SizeBase<VectorType> {
        get { return SizeBase(width: self.width, height: self.height) }
        set {
            self.width = newValue.width
            self.height = newValue.height
        }
    }

    ///Initialiaze the zero rect.
    public init() {}

    ///Initializes a `RectBase` with the given values.
    /// - parameter x: The first component of the rect.
    /// - parameter y: The second component of the rect.
    /// - parameter z: The third component of the rect.
    /// - parameter w: The fourth component of the rect.
    public init(x:VectorType, y:VectorType, width:VectorType, height:VectorType) {
        self.components = [x, y, width, height]
    }

    ///Initializes a `RectBase` with the given values.
    /// - parameter origin: The origin of the rect (the first two components).
    /// - parameter size: The size of the rect (the second two components).
    public init(origin:PointBase<VectorType>, size:SizeBase<VectorType>) {
        self.components = origin.components + size.components
    }

    ///Provides access to the underlying components of this instance.
    /// - parameter index: The index of the component to access.
    /// - returns: The component at the given index.
    public subscript(index:Int) -> VectorType {
        get { return self.components[index] }
        set { self.components[index] = newValue }
    }

}

extension RectBase where VectorType: Numeric & Multiplicable {
    ///The unit rectangle in the `VectorType` space. Has origin zero and size one.
    public static var unitRect:RectBase<VectorType> { return RectBase(x: VectorType.zero, y: VectorType.zero, width: VectorType.one, height: VectorType.one) }
}

extension RectBase: Addable where VectorType: Numeric & Addable {}
extension RectBase: Equatable where VectorType: Equatable {}
extension RectBase: VectorBase where VectorType: Numeric {}
extension RectBase: ConstantSizeVector where VectorType: Numeric {}
extension RectBase: SignedVectorBase where VectorType: SignedNumeric {}
extension RectBase: FloatingPointVector where VectorType: FloatingPoint {}
extension RectBase: ConstantSizeFloatingPointVector where VectorType: FloatingPoint {}
