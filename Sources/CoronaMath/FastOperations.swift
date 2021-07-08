// Centralize methods that require hardware acceleration into this file
// to reduce the need for conditional imports elsewhere.

import Foundation
#if os(iOS) || os(macOS)
import Accelerate
#else
#if canImport(COpenBlas)
import COpenBlas
#else
import COpenBlas86_64
#endif
private typealias __CLPK_integer = Int32
#endif

/// Either a `Float` or a `Double`. Used to unify APIs for matrix and vector
/// math, so methods can use generics instead of being overloaded.
internal protocol FloatOrDouble {
    static var cblas_gemm:(_ __Order: CBLAS_ORDER, _ __TransA: CBLAS_TRANSPOSE, _ __TransB: CBLAS_TRANSPOSE, _ __M: Int32, _ __N: Int32, _ __K: Int32, _ __alpha: Self, _ __A: UnsafePointer<Self>?, _ __lda: Int32, _ __B: UnsafePointer<Self>?, _ __ldb: Int32, _ __beta: Self, _ __C: UnsafeMutablePointer<Self>?, _ __ldc: Int32) -> Void { get }
}
extension Float: FloatOrDouble {
    internal static let cblas_gemm = cblas_sgemm
}
extension Double: FloatOrDouble {
    internal static let cblas_gemm = cblas_dgemm
}

/// A vector that can be initialized quickly.
internal protocol FastInitializableVector: ConstantSizeVector {
    /// Initializes the vector directly with `exactComponents`. The caller is responsible for
    /// ensuring `exactComponents` has the correct count.
    init(exactComponents:[ComponentType])
}

/// A matrix that can be initialized quickly.
internal protocol FastInitializableMatrix: SquareMatrix {
    /// Initializes the matrix directly with `exactElements`. The caller is responsible for
    /// ensuring `exactComponents` has the correct count.
    init(exactElements:[ElementType])
}

// MARK: - Square Matrix

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

///Calculates the matrix product of two matrices.
///Must be functions because making them operator overloads for `SquareMatrix` doesn't
///work. The generic multiplication method is called because Swift does not prefer the
///method with more specific generic constraints.
/// - parameter lhs: The matrix on the left of the multiplication.
/// - parameter rhs: The matrix on the right of the multiplication.
/// - returns: The product of *lhs* and *rhs*.
internal func fastMultiplyMatrices<M>(lhs:M, rhs:M) -> M where M: FastInitializableMatrix, M.ElementType: FloatOrDouble {
    var vals = [M.ElementType](repeating: M.ElementType.zero, count: M.size * M.size)
    M.ElementType.cblas_gemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, Int32(M.size), Int32(M.size), Int32(M.size), M.ElementType.one, lhs.elements, Int32(M.size), rhs.elements, Int32(M.size), M.ElementType.zero, &vals, Int32(M.size))
    return M(exactElements: vals)
}

internal func fastMultiply<M, V>(matrix:M, vector:V) throws -> V where
    M: MatrixBase, V: FastInitializableVector,
    M.ElementType: FloatOrDouble, M.ElementType == V.ComponentType {
    try require(dimensions: matrix.dimensions, canMultiplyBy: vector.dimensions)
    var output = [M.ElementType](repeating: M.ElementType.zero, count: vector.numberOfComponents)
        M.ElementType.cblas_gemm(CblasRowMajor, CblasNoTrans, CblasNoTrans, Int32(matrix.dimensions.rows), 1, Int32(matrix.dimensions.columns), M.ElementType.one, matrix.elements, Int32(matrix.dimensions.columns), vector.components, Int32(vector.dimensions.columns), M.ElementType.zero, &output, Int32(vector.dimensions.columns))
    return V(exactComponents: output)
}

// MARK: - Matrix4Base
