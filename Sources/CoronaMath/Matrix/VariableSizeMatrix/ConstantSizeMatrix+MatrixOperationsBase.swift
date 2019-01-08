//
//  ConstantSizeMatrix+MatrixOperationsBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 1/2/19.
//

import Foundation
import CoronaErrors

extension ConstantSizeMatrix where Self: MatrixOperationsBase {

    public func add<M>(by matrix: M) throws -> Self where
        M: MatrixBase,
        ElementType == M.ElementType {
        guard self.dimensions == matrix.dimensions else {
            throw ValueException<IntSize>.expected(value: self.dimensions, error: MatrixError.incorrectDimensions, actualValue: matrix.dimensions)
        }
        return Self(elements: zip(self.elements, matrix.elements).map(+))
    }

    public func subtract<M>(by matrix: M) throws -> Self where
        M: MatrixBase,
        ElementType == M.ElementType {
        guard self.dimensions == matrix.dimensions else {
            throw ValueException<IntSize>.expected(value: self.dimensions, error: MatrixError.incorrectDimensions, actualValue: matrix.dimensions)
        }
        return Self(elements: zip(self.elements, matrix.elements).map(-))
    }

}

public func +<M>(lhs:M, rhs:M.ElementType) -> M where M: ConstantSizeMatrix, M: MatrixOperationsBase {
    return M(elements: lhs.elements.map() { $0 + rhs })
}

public func +<M>(lhs:M.ElementType, rhs:M) -> M where M: ConstantSizeMatrix, M: MatrixOperationsBase {
    return M(elements: rhs.elements.map() { $0 + lhs })
}

public func -<M>(lhs:M, rhs:M.ElementType) -> M where M: ConstantSizeMatrix, M: MatrixOperationsBase {
    return M(elements: lhs.elements.map() { $0 - rhs })
}

public func -<M>(lhs:M.ElementType, rhs:M) -> M where M: ConstantSizeMatrix, M: MatrixOperationsBase {
    return M(elements: rhs.elements.map() { lhs - $0 })
}

public func *<M>(lhs:M, rhs:M.ElementType) -> M where M: ConstantSizeMatrix, M: MatrixOperationsBase {
    return M(elements: lhs.elements.map() { $0 * rhs })
}

public func *<M>(lhs:M.ElementType, rhs:M) -> M where M: ConstantSizeMatrix, M: MatrixOperationsBase {
    return M(elements: rhs.elements.map() { $0 * lhs })
}

public func /<M>(lhs:M, rhs:M.ElementType) -> M where M: ConstantSizeMatrix, M: FloatingPointMatrix {
    return M(elements: lhs.elements.map() { $0 / rhs })
}

public func /<M>(lhs:M.ElementType, rhs:M) -> M where M: ConstantSizeMatrix, M: FloatingPointMatrix {
    return M(elements: rhs.elements.map() { lhs / $0 })
}
