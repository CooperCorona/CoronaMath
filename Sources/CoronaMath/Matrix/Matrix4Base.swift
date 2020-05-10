//
//  Matrix4Base.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A 4x4 matrix. Conforms to Equatable, MatrixBase, ConstantSizeMatrix, and SquareMatrix.
///Conforms to MatrixOperationsBase by the extensions in VariableSizeMatrix.
public struct Matrix4Base<MatrixType>:
    Equatable, MatrixBase, ConstantSizeMatrix, SquareMatrix
    where MatrixType: MatrixElementType {

    // MARK: - Static Properties

    ///The type of the matrix's elements.
    public typealias ElementType = MatrixType

    /// The number of rows and columns of the matrix.
    /// *Self.dimensions* and *self.dimensions* must equal
    /// *size* for both components.
    public static var size: Int { return 4 }

    ///The identity 4x4 matrix.
    public static var identity: Matrix4Base<MatrixType> {
        //There seems to be a compiler bug that causes the build to hang
        //if an array literal comtains more than 12 elements. Constructing
        //the array in 2 parts fixes this.
        var elements = [
            MatrixType.one, MatrixType.zero, MatrixType.zero, MatrixType.zero,
            MatrixType.zero, MatrixType.one, MatrixType.zero, MatrixType.zero,
        ]
        elements += [
            MatrixType.zero, MatrixType.zero, MatrixType.one, MatrixType.zero,
            MatrixType.zero, MatrixType.zero, MatrixType.zero, MatrixType.one
        ]
        return Matrix4Base<MatrixType>(elements: elements)
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
        let n = Matrix4Base<MatrixType>.numberOfElements
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

///Wraps `fastMultiply` so `Matrix4Base<Float>` can be multiplied using `*` but it
///does not match to the generic, slow version.
public func *(lhs:Matrix4Base<Float>, rhs:Matrix4Base<Float>) -> Matrix4Base<Float> {
    return fastMultiply(lhs: lhs, rhs: rhs)
}

public func *(lhs:Matrix4Base<Double>, rhs:Matrix4Base<Double>) -> Matrix4Base<Double> {
    return fastMultiply(lhs: lhs, rhs: rhs)
}

public func *=(lhs:inout Matrix4Base<Float>, rhs:Matrix4Base<Float>) {
    lhs = fastMultiply(lhs: lhs, rhs: rhs)
}

public func *=(lhs:inout Matrix4Base<Double>, rhs:Matrix4Base<Double>) {
    lhs = fastMultiply(lhs: lhs, rhs: rhs)
}
