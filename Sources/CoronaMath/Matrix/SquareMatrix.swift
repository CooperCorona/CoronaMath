//
//  SquareMatrix.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation
#if os(iOS) || os(macOS)
import Accelerate
#endif

public protocol SquareMatrix: ConstantSizeMatrix {

    // MARK: - Required Implementations

    ///The number of rows and columns of the matrix.
    ///*Self.dimensions* and *self.dimensions* must equal
    ///*size* for both components. Must be greater than 0.
    static var size:Int { get }

    // MARK: - Optional Implementations

    ///The identity matrix for this size of matrices. The product of a matrix
    ///and the identity matrix is the original matrix.
    static var identity:Self { get }

    ///Calculates the matrix product of two matrices.
    /// - parameter lhs: The matrix on the left of the multiplication.
    /// - parameter rhs: The matrix on the right of the multiplication.
    /// - returns: The product of *lhs* and *rhs*.
    static func *(lhs:Self, rhs:Self) -> Self
    ///Calculates the matrix product of two matrices.
    /// - parameter lhs: The matrix on the left of the multiplication.
    /// - parameter rhs: The matrix on the right of the multiplication.
    /// - returns: The product of *lhs* and *rhs*.
    static func *=(lhs:inout Self, rhs:Self)

}

// MARK: - Default Implementations

extension SquareMatrix {

    public static var dimensions:IntPoint { return IntPoint(rows: Self.size, columns: Self.size) }
    public static var identity:Self {
        return Self(elements: (0..<self.numberOfElements).map() {
            return ($0 % self.dimensions.row == 0) ? ElementType.one : ElementType.zero
        })
    }

    public func transpose() -> Self {
        var elements:[ElementType] = []
        for i in 0..<self.numberOfElements {
            let row = i % self.dimensions.row
            let column = i / self.dimensions.row
            elements.append(self[row, column])
        }
        return Self(elements: elements)
    }

}

public func *<M>(lhs:M, rhs:M) -> M where M: SquareMatrix {
    var elements:[M.ElementType] = []
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

#if os(iOS) || os(macOS)
extension SquareMatrix where ElementType == Double {

    public func inverse() -> Self {
        var inMatrix = self.elements
        var n = __CLPK_integer(Self.size)
        var pivots = [__CLPK_integer](repeating: 0, count: Self.size)
        var workspace = [Double](repeating: 0.0, count: Self.size)
        var error : __CLPK_integer = 0

        withUnsafeMutablePointer(to: &n) {
            dgetrf_($0, $0, &inMatrix, $0, &pivots, &error)
            dgetri_($0, &inMatrix, $0, &pivots, &workspace, $0, &error)
        }
        return Self(elements: inMatrix)
    }

}

extension SquareMatrix where ElementType == Float {

    public func inverse() -> Self {
        var inMatrix = self.elements
        var n = __CLPK_integer(Self.size)
        var pivots = [__CLPK_integer](repeating: 0, count: Self.size)
        var workspace = [Float](repeating: 0.0, count: Self.size)
        var error : __CLPK_integer = 0

        withUnsafeMutablePointer(to: &n) {
            sgetrf_($0, $0, &inMatrix, $0, &pivots, &error)
            sgetri_($0, &inMatrix, $0, &pivots, &workspace, $0, &error)
        }
        return Self(elements: inMatrix)
    }

}

public func *<M>(lhs:M, rhs:M) -> M where M: SquareMatrix, M.ElementType == Float {
    var vals = [Float](repeating: 0.0, count: M.size * M.size)
    cblas_sgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, Int32(M.size), Int32(M.size), Int32(M.size), Float(1.0), lhs.elements, Int32(M.size), lhs.elements, Int32(M.size), Float(0.0), &vals, Int32(M.size))
    return M(elements: vals)
}

public func *<M>(lhs:M, rhs:M) -> M where M: SquareMatrix, M.ElementType == Double {
    var vals = [Double](repeating: 0.0, count: M.size * M.size)
    cblas_dgemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, Int32(M.size), Int32(M.size), Int32(M.size), Double(1.0), lhs.elements, Int32(M.size), lhs.elements, Int32(M.size), Double(0.0), &vals, Int32(M.size))
    return M(elements: vals)
}
#endif

public func *=<M>(lhs:inout M, rhs:M) where M: SquareMatrix {
    lhs = lhs * rhs
}
