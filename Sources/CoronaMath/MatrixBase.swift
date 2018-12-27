//
//  MatrixBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/25/18.
//

import Foundation

///An 2-dimensional NxM list of elements of some type.
public protocol MatrixBase {
    
    // MARK: - Required Implementations
    
    ///The type of the elements of the matrix.
    associatedtype ComponentType: Addable & Multiplicable
    
    ///The dimensions of the matrix. The first component is the number of rows
    ///and the second component is the number of columns. Both components must
    ///be greater than 0.
    static var dimensions:IntPoint { get }
    
    ///The values of the matrix. The number of elements must equal
    ///the number of rows times the number of columns.
    var elements:[ComponentType] { get }
    
    ///Provides access to the individual components.
    /// - parameter index: The index of the component to get or set.
    /// - returns: The value of the component at the given index.
    subscript(index:Int) -> ComponentType { get set }
    
    ///Initializes the elements of the matrix with default values.
    init()
    
    // MARK: - Default Implementations
    
    ///Initializes this instance with the specified eleemnts. If *elements* does not
    ///contain enough values, the remaining elements should be initialized to 0.
    ///If *elements* contains too many elements, the extra values should be ignored.
    /// - parameter: an array of *ComponentType* elements representing the elements of the matrix.
    /// - returns: a matrix initialized with the values of *elements*.
    init(elements:[ComponentType])
    
    ///Adds this matrix to another matrix. The dimensions of both matrices must be equal.
    /// - parameter matrix: The matrix to add to this one.
    /// - returns: A matrix whose elements are the result of adding *self* and
    ///*matrix* component-wise.
    func add<OtherMatrix, ResultMatrix>(by matrix:OtherMatrix) throws -> ResultMatrix where
        OtherMatrix: MatrixBase,
        ResultMatrix: MatrixBase,
        Self.ComponentType == OtherMatrix.ComponentType
    
    ///Multiplies this matrix by another matrix. The number of columns in *self* must equal
    ///the number of rows in *matrix*. If not, an exception is thrown. The resulting matrix
    ///has *self.dimensions.rows* rows and *matrix.dimensions.columns* columns.
    /// - parameter: The matrix on the right to multiply this matrix by.
    /// - returns: A matrix resulting from the multiplication of *self* and *matrix*.
    func multiply<OtherMatrix, ResultMatrix>(by matrix:OtherMatrix) throws -> ResultMatrix where
        OtherMatrix: MatrixBase,
        ResultMatrix: MatrixBase,
        Self.ComponentType == OtherMatrix.ComponentType
    
    ///Returns the transpose of this matrix. Transposing a matrix turns
    ///rows to columns and vice versa.
    /// - returns: A matrix whose rows are the columns of *self* and vice versa.
    func transpose<ResultMatrix>() -> ResultMatrix where
        ResultMatrix: MatrixBase,
        Self.ComponentType == ResultMatrix.ComponentType
    
}
