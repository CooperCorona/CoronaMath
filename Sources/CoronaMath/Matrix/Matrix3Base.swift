//
//  Matrix3Base.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A 3x3 matrix. Conforms to Equatable, MatrixBase, ConstantSizeMatrix, and SquareMatrix.
///Conforms to MatrixOperationsBase by the extensions in VariableSizeMatrix/.
public struct Matrix3Base<MatrixType>:
    Equatable, MatrixBase, ConstantSizeMatrix, SquareMatrix
    where MatrixType: MatrixElementType {

    // MARK: - Static Properties

    ///The type of the matrix's elements.
    public typealias ElementType = MatrixType

    ///The number of rows and columns of the matrix.
    ///*Self.dimensions* and *self.dimensions* must equal
    ///*size* for both components.
    public static var size: Int { return 3 }

    ///The identity 3x3 matrix.
    public static var identity: Matrix3Base<MatrixType> {
        return Matrix3Base<MatrixType>(elements: [
            MatrixType.one, MatrixType.zero, MatrixType.zero,
            MatrixType.zero, MatrixType.one, MatrixType.zero,
            MatrixType.zero, MatrixType.zero, MatrixType.one
        ])
    }

    // MARK: - Instance Properties

    ///The values of the matrix. The number of elements must equal
    ///the number of rows times the number of columns.
    public private(set) var elements:[MatrixType]

    ///Initializes this instance with the specified elements. If *elements* does not
    ///contain enough values, the remaining elements are initialized to 0.
    ///If *elements* contains too many elements, the extra values are ignored.
    /// - parameter: an array of *ElementType* elements representing the elements of the matrix.
    /// - returns: a matrix initialized with the values of *elements*.
    public init(elements:[MatrixType]) {
        let n = Matrix3Base<MatrixType>.numberOfElements
        self.elements = elements.of(length: n, padding: MatrixType.zero)
    }

    ///Provides access to the individual elements.
    /// - parameter index: The index of the element to get or set.
    /// - returns: The value of the element at the given index.
    public subscript(index:Int) -> MatrixType {
        get { return self.elements[index] }
        set { self.elements[index] = newValue }
    }

}

extension Matrix3Base: ContinuousMatrix where MatrixType: ContinuousNumber {

    ///Constructs a matrix with the given translation, scale, and rotation. The final matrix components are directly
    ///calculated without constructing individual matrices and multiplying them.
    /// - parameter translation: The x and y translation of the matrix.
    /// - parameter scale: The horizontal and vertical scale of the matrix.
    /// - parameter rotation: The rotation, in radians counterclockwise, of the matrix.
    public init(translation:PointBase<MatrixType>, scale:PointBase<MatrixType>, rotation:MatrixType) {
        self.init(translation: translation, scale: scale, rotation: rotation, anchor: PointBase<MatrixType>.zero, size: SizeBase<MatrixType>.zero)/*
        var elements = [
            MatrixType.one, MatrixType.zero, MatrixType.zero,
            MatrixType.zero, MatrixType.one, MatrixType.zero,
            MatrixType.zero, MatrixType.zero, MatrixType.one
        ]
        let cosine = MatrixType.cos(rotation)
        let sine = MatrixType.sin(rotation)
        elements[0 * 3 + 0] = scale.x * cosine
        elements[0 * 3 + 1] = -scale.x * sine
        elements[0 * 3 + 2] = translation.x
        elements[1 * 3 + 0] = scale.x * sine
        elements[1 * 3 + 1] = scale.y * cosine
        elements[1 * 3 + 2] = translation.y
        self.init(elements: elements)*/
    }

    ///Constructs a matrix with the given translation, scale, rotation, anchor, and size. `anchor` is the point of rotation and scaling.
    ///The final matrix components are directly calculated without constructing individual matrices and multiplying them.
    /// - parameter translation: The x and y translation of the matrix.
    /// - parameter scale: The horizontal and vertical scale of the matrix.
    /// - parameter rotation: The rotation, in radians counterclockwise, of the matrix.
    /// - parameter anchor: The point of scale, rotation, and size-offset.
    /// - parameter size: The size of the coordinate space defined by this matrix. The matrix is translated to
    /// treat `anchor` as the center of the coordinate space before applying scale and rotation. Then `translation` is applied.
    public init(translation:PointBase<MatrixType>, scale:PointBase<MatrixType>, rotation:MatrixType, anchor:PointBase<MatrixType>, size:SizeBase<MatrixType>) {
        var elements = [
            MatrixType.one, MatrixType.zero, MatrixType.zero,
            MatrixType.zero, MatrixType.one, MatrixType.zero,
            MatrixType.zero, MatrixType.zero, MatrixType.one
        ]
        let cosine = MatrixType.cos(rotation)
        let sine = MatrixType.sin(rotation)
        let a = -anchor.x * size.width
        let b = -anchor.y * size.height
        let anchorOffsetXX = a * scale.x * cosine
        let anchorOffsetXY = b * scale.x * sine
        let anchorOffsetYY = a * scale.y * sine
        let anchorOffsetYX = b * scale.y * cosine
        print("a:              \(a)")
        print("b:              \(b)")
        print("cosine:         \(cosine)")
        print("sine:           \(sine)")
        print("anchorOffsetXX: \(anchorOffsetXX)")
        print("anchorOffsetXY: \(anchorOffsetXY)")
        print("anchorOffsetYY: \(anchorOffsetYY)")
        print("anchorOffsetYX: \(anchorOffsetYX)")
        elements[0 * 3 + 0] = scale.x * cosine
        elements[0 * 3 + 1] = -scale.x * sine
        elements[0 * 3 + 2] = anchorOffsetXX - anchorOffsetXY + translation.x
        elements[1 * 3 + 0] = scale.y * sine
        elements[1 * 3 + 1] = scale.y * cosine
        elements[1 * 3 + 2] = anchorOffsetYY + anchorOffsetYX + translation.y
        self.init(elements: elements)
    }

}

///Wraps `fastMultiply` so `Matrix3Base<Float>` can be multiplied using `*` but it
///does not match to the generic, slow version.
public func *(lhs:Matrix3Base<Float>, rhs:Matrix3Base<Float>) -> Matrix3Base<Float> {
    return fastMultiplyMatrices(lhs: lhs, rhs: rhs)
}

public func *(lhs:Matrix3Base<Double>, rhs:Matrix3Base<Double>) -> Matrix3Base<Double> {
    return fastMultiplyMatrices(lhs: lhs, rhs: rhs)
}

public func *=(lhs:inout Matrix3Base<Float>, rhs:Matrix3Base<Float>) {
    lhs = fastMultiplyMatrices(lhs: lhs, rhs: rhs)
}

public func *=(lhs:inout Matrix3Base<Double>, rhs:Matrix3Base<Double>) {
    lhs = fastMultiplyMatrices(lhs: lhs, rhs: rhs)
}
