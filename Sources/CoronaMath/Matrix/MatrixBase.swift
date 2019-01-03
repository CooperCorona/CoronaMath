//
//  MatrixBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/25/18.
//

import Foundation

///The protocols to which a type must conform to be an element in a matrix.
public typealias MatrixElementType = Numeric & Addable & Multiplicable

///An 2-dimensional NxM list of elements of some type.
///
///Most mathematical operations are in the `MatrixOperationsBase` protocol.
///Although logically, `MatrixBase` represents a matrix and so should require
///the operations, in practice the majority of implementations don't need the
///full flexibility, so it's a lot of wasted boilerplate. Classes may conform
///to `MatrixOperationsBase` to implement the full spectrum of matrix operations.
public protocol MatrixBase: Equatable {
    
    // MARK: - Required Implementations
    
    ///The type of the elements of the matrix.
    associatedtype ElementType: MatrixElementType
    
    ///The dimensions of the matrix. The first component is the number of rows
    ///and the second component is the number of columns. Both components must
    ///be greater than 0.
    var dimensions:IntPoint { get }
    
    ///The values of the matrix. The number of elements must equal
    ///the number of rows times the number of columns.
    var elements:[ElementType] { get }
    
    ///Provides access to the individual elements.
    /// - parameter index: The index of the element to get or set.
    /// - returns: The value of the element at the given index.
    subscript(index:Int) -> ElementType { get set }

    // MARK: - Optional Implementations

    ///Provides access to the individual elements.
    /// - parameter row: The index of the row.
    /// - parameter column: The index of the column.
    /// - returns: The value of the element at the given index.
    subscript(row:Int, column:Int) -> ElementType { get set }

    ///Determines if two matrices are equal.
    /// - parameter lhs: This matrix.
    /// - parameter rhs: The matrix to compare to.
    /// - returns: *true* if the two matrices are equal, false otherwise.
    static func ==<M>(lhs:Self, rhs:M) -> Bool where
        M: MatrixBase,
        Self.ElementType == M.ElementType
}

// MARK: - Default Implementations

extension MatrixBase {

    public var numberOfElements:Int { return self.dimensions.rows * self.dimensions.columns }

    public subscript(row:Int, column:Int) -> ElementType {
        get { return self[row * self.dimensions.rows + column] }
        set { self[row * self.dimensions.rows + column] = newValue }
    }

}

public func ==<M1, M2>(lhs:M1, rhs:M2) -> Bool where
    M1: MatrixBase,
    M2: MatrixBase,
    M1.ElementType == M2.ElementType {
    return lhs.dimensions == rhs.dimensions && lhs.elements == rhs.elements
}
