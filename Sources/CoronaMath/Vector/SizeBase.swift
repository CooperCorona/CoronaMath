//
//  SizeBase.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/8/19.
//

import Foundation

///A 2-dimensional vector representing a size.
public struct SizeBase<VectorType> where VectorType: Addable {

    ///The number of components in a `SizeBase` instance.
    public static var numberOfComponents: Int { return 2 }

    ///The values of this vector.
    public private(set) var components = [VectorType](repeating: VectorType.zero, count: SizeBase.numberOfComponents)

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
extension SizeBase: Equatable where VectorType: Equatable {}
extension SizeBase: VectorBase where VectorType: Numeric {}
extension SizeBase: ConstantSizeVector where VectorType: Numeric {}
extension SizeBase: SignedVectorBase where VectorType: SignedNumeric {}
extension SizeBase: FloatingPointVector where VectorType: FloatingPoint {}
extension SizeBase: ConstantSizeFloatingPointVector where VectorType: FloatingPoint {}
