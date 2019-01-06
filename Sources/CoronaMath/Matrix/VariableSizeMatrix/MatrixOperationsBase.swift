//
//  MatrixOperationsBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 1/2/19.
//

import Foundation

///A matrix declaring the full suite of mathematical operations
///(addition, scalar addition, multiplication, scalar multiplication, etc).
public protocol MatrixOperationsBase: MatrixBase {

    // MARK: - Required Implementations

    ///The type returned by adding or subtracting two matrices.
    associatedtype MatrixAdditionType: MatrixBase where MatrixAdditionType.ElementType == Self.ElementType
    ///The type returned by multiplying two matrices.
    associatedtype MatrixMultiplicationType: MatrixBase
    ///The type returned by transposing this matrix.
    associatedtype MatrixTransposeType: MatrixBase where MatrixMultiplicationType.ElementType == Self.ElementType

    ///Adds `self` and `matrix` component-wise.
    /// - parameter matrix: The matrix to add to this matrix.
    /// - throws: `MatrixError.incorrectDimensions` if `self.dimensions` does not equal
    ///`matrix.dimensions`.
    /// - returns: The result of adding `self` and `matrix`.
    func add<M>(by matrix:M) throws -> MatrixAdditionType where
        M: MatrixBase,
        ElementType == M.ElementType

    ///Subtracts `self` and `matrix` component-wise.
    /// - parameter matrix: The matrix to subtract from this matrix.
    /// - throws: `MatrixError.incorrectDimensions` if `self.dimensions` does not equal
    ///`matrix.dimensions`.
    /// - returns: The result of subracting `matrix` and `self`.
    func subtract<M>(by matrix:M) throws -> MatrixAdditionType where
        M: MatrixBase,
        ElementType == M.ElementType

    ///Performs matrix multiplication on `self` and `matrix` (not component-wise).
    /// - parameter matrix: The matrix to multiply with this matrix.
    /// - throws: `MatrixError.incorrectDimensions` if `self.dimensions.column` does
    ///not equal `matrix.dimensions.row`.
    /// - returns: The result of multiplying `self` and `matrix`.
    func multiply<M>(by matrix:M) throws -> MatrixMultiplicationType where
        M: MatrixBase,
        ElementType == M.ElementType

    ///Returns the transpose of this matrix. Transposing a matrix turns
    ///rows to columns and vice versa.
    /// - returns: A matrix whose rows are the columns of *self* and vice versa.
    func transpose() -> MatrixTransposeType

    ///Adds a matrix and a scalar.
    /// - parameter lhs: The current matrix.
    /// - parameter rhs: The scalar to add to the elements.
    /// - returns: A matrix with dimensions equal to *lhs.dimensions* with
    ///*rhs* added to all elements.
    static func +(lhs:Self, rhs:ElementType) -> Self
    ///Adds a scalar and a matrix.
    /// - parameter lhs: The scalar to add to the elements.
    /// - parameter rhs: The current matrix.
    /// - returns: A matrix with dimensions equal to *rhs.dimensions* with
    ///*lhs* added to all elements.
    static func +(lhs:ElementType, rhs:Self) -> Self

    ///Subtracts a scalar from a matrix.
    /// - parameter lhs: The current matrix.
    /// - parameter rhs: The scalar to subtract from the elements.
    /// - returns: A matrix with dimensions equal to *lhs.dimensions* with
    ///*rhs* subtracted from all elements.
    static func -(lhs:Self, rhs:ElementType) -> Self
    ///Subtracts a matrix from a scalar.
    /// - parameter lhs: The scalar from which to subtract the matrix's elements.
    /// - parameter rhs: The current matrix.
    /// - returns: A matrix with dimensions equal to *rhs.dimensions* with
    ///all elements subtracted from *lhs*.
    static func -(lhs:ElementType, rhs:Self) -> Self

    ///Multiplies a matrix by a scalar.
    /// - parameter lhs: The current matrix.
    /// - parameter rhs: The scalar to multiply the elements of the matrix by.
    /// - returns: A matrix with dimensions equal to *lhs.dimensions* with
    ///all elements multiplied by *rhs*.
    static func *(lhs:Self, rhs:ElementType) -> Self
    ///Multiplies a scalar by a matrix.
    /// - parameter lhs: The scalar to multiply the elements of the matrix by.
    /// - parameter rhs: The current matrix.
    /// - returns: A matrix with dimensions equal to *rhs.dimensions* with
    ///all elements multiplied by *lhs*.
    static func *(lhs:ElementType, rhs:Self) -> Self

    // MARK: - Optional Implementations

    ///Adds and assigns a scalar and a matrix.
    /// - parameter lhs: The matrix to add and assign.
    /// - parameter rhs; THe scalar to add by.
    static func +=(lhs:inout Self, rhs:ElementType)
    ///Subtracts and assigns a scalar and a matrix.
    /// - parameter lhs: The matrix to subtract and assign.
    /// - parameter rhs; THe scalar to subtract by.
    static func -=(lhs:inout Self, rhs:ElementType)
    ///Multiplies and assigns a scalar and a matrix.
    /// - parameter lhs: The matrix to multiply and assign.
    /// - parameter rhs; THe scalar to multiply by.
    static func *=(lhs:inout Self, rhs:ElementType)

}

// MARK: - Default Implementations

public func +=<M>(lhs:inout M, rhs:M.ElementType) where M: MatrixOperationsBase {
    lhs = lhs + rhs
}

public func -=<M>(lhs:inout M, rhs:M.ElementType) where M: MatrixOperationsBase {
    lhs = lhs - rhs
}

public func *=<M>(lhs:inout M, rhs:M.ElementType) where M: MatrixOperationsBase {
    lhs = lhs * rhs
}
