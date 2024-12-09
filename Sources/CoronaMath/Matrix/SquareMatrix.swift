//
//  SquareMatrix.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A matrix whose dimensions are determined at compile time and whose
///rows equal its columns.
public protocol SquareMatrix: ConstantSizeMatrix {

    // MARK: - Required Implementations

    ///The number of rows and columns of the matrix.
    ///*Self.dimensions* and *self.dimensions* must equal
    ///*size* for both components. Must be greater than 0.
    static var size: Int { get }
    ///The number of rows and columns of the matrix. Derived
    ///from `size`.
    static var dimensions: IntSize { get }

    // MARK: - Optional Implementations

    ///The identity matrix for this size of matrices. The product of a matrix
    ///and the identity matrix is the original matrix.
    static var identity: Self { get }

    ///Calculates the matrix product of two matrices.
    /// - parameter lhs: The matrix on the left of the multiplication.
    /// - parameter rhs: The matrix on the right of the multiplication.
    /// - returns: The product of *lhs* and *rhs*.
    static func * (lhs: Self, rhs: Self) -> Self

    ///Calculates the matrix product of two matrices.
    /// - parameter lhs: The matrix on the left of the multiplication.
    /// - parameter rhs: The matrix on the right of the multiplication.
    /// - returns: The product of *lhs* and *rhs*.
    static func *= (lhs: inout Self, rhs: Self)

}

// MARK: - Default Implementations

extension SquareMatrix {

    public static var dimensions: IntSize { return IntSize(rows: Self.size, columns: Self.size) }
    public static var identity: Self {
        return Self(
            elements: (0..<self.numberOfElements).map {
                return ($0 % self.dimensions.rows == 0) ? ElementType.one : ElementType.zero
            })
    }

    public func transpose() -> Self {
        let elements = pairs(0..<self.dimensions.columns, 0..<self.dimensions.rows)
            .map { row, column in self[column, row] }
        return Self(elements: elements)
    }

}

public func * <M>(lhs: M, rhs: M) -> M where M: SquareMatrix {
    var elements: [M.ElementType] = []
    for row in 0..<M.size {
        for column in 0..<M.size {
            var value = M.ElementType.zero
            for i in 0..<M.size {
                value = value + lhs[row, i] * rhs[i, column]
            }
            elements.append(value)
        }
    }
    return M(elements: elements)
}

public func *= <M>(lhs: inout M, rhs: M) where M: SquareMatrix {
    lhs = lhs * rhs
}
