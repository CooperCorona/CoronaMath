//
//  VariableSizeMatrix.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/30/18.
//

import CoronaErrors
import Foundation

///A matrix whose dimensions are determined at runtime.
public struct VariableSizeMatrix<MatrixType>: MatrixOperationsBase
where MatrixType: MatrixElementType {

    ///The type of the matrix's elements.
    public typealias ElementType = MatrixType

    ///The dimensions of the matrix. The first component is the number of rows
    ///and the second component is the number of columns. Both components must
    ///be greater than 0.
    public let dimensions: IntSize
    ///The values of the matrix. The number of elements must equal
    ///the number of rows times the number of columns.
    public private(set) var elements: [MatrixType]

    ///Initializes the matrix with the given dimensions and all elements equal
    ///to `MatrixType.zero`.
    public init(dimensions: IntSize) {
        let n = dimensions.rows * dimensions.columns
        self.dimensions = dimensions
        self.elements = [MatrixType](repeating: MatrixType.zero, count: n)
    }

    ///Initializes the matrix with the given dimensions and elements.
    ///If `elements` does not contain enough elements, the remaining
    ///values are filled with `MatrixType.zero`. If `elements` contains
    ///too many elements, the extra elements are ignored.
    public init(dimensions: IntSize, elements: [MatrixType]) {
        let n = dimensions.rows * dimensions.columns
        self.dimensions = dimensions
        self.elements = elements.of(length: n, padding: MatrixType.zero)
    }

    ///Provides access to the underlying elements.
    /// - parameter index: The index of the element. Must be in range `[0, self.numberOfElements)`.
    /// - returns: The value of the element at the given index.
    public subscript(index: Int) -> MatrixType {
        get {
            return self.elements[index]
        }
        set {
            self.elements[index] = newValue
        }
    }

    ///Adds `self` and `matrix` component-wise.
    /// - parameter matrix: The matrix to add to this matrix.
    /// - throws: `MatrixError.incorrectDimensions` if `self.dimensions` does not equal
    ///`matrix.dimensions`.
    /// - returns: The result of adding `self` and `matrix`.
    public func add<M>(by matrix: M) throws -> VariableSizeMatrix<MatrixType>
    where
        M: MatrixBase,
        ElementType == M.ElementType
    {
        guard self.dimensions == matrix.dimensions else {
            throw ValueException<IntSize>.expected(
                value: self.dimensions, error: MatrixError.incorrectDimensions,
                actualValue: matrix.dimensions)
        }
        return VariableSizeMatrix(
            dimensions: self.dimensions, elements: zip(self.elements, matrix.elements).map(+))
    }

    ///Subtracts `self` and `matrix` component-wise.
    /// - parameter matrix: The matrix to subtract from this matrix.
    /// - throws: `MatrixError.incorrectDimensions` if `self.dimensions` does not equal
    ///`matrix.dimensions`.
    /// - returns: The result of subracting `matrix` and `self`.
    public func subtract<M>(by matrix: M) throws -> VariableSizeMatrix<MatrixType>
    where
        M: MatrixBase,
        ElementType == M.ElementType
    {
        guard self.dimensions == matrix.dimensions else {
            throw ValueException<IntSize>.expected(
                value: self.dimensions, error: MatrixError.incorrectDimensions,
                actualValue: matrix.dimensions)
        }
        return VariableSizeMatrix(
            dimensions: self.dimensions, elements: zip(self.elements, matrix.elements).map(-))
    }

    ///Performs matrix multiplication on `self` and `matrix` (not component-wise).
    /// - parameter matrix: The matrix to multiply with this matrix.
    /// - throws: `MatrixError.incorrectDimensions` if `self.dimensions.column` does
    ///not equal `matrix.dimensions.row`.
    /// - returns: The result of multiplying `self` and `matrix`.
    public func multiply<M>(by matrix: M) throws -> VariableSizeMatrix<MatrixType>
    where
        M: MatrixBase,
        ElementType == M.ElementType
    {
        try require(dimensions: self.dimensions, canMultiplyBy: matrix.dimensions)
        let dimensions = IntSize(rows: self.dimensions.rows, columns: matrix.dimensions.columns)
        var elements: [M.ElementType] = []
        for (row, column) in pairs(0..<dimensions.rows, 0..<dimensions.columns) {
            var value = M.ElementType.zero
            for i in 0..<self.dimensions.columns {
                value = value + self[row, i] * matrix[i, column]
            }
            elements.append(value)
        }
        return VariableSizeMatrix(dimensions: dimensions, elements: elements)
    }

    ///Returns the transpose of this matrix. Transposing a matrix turns
    ///rows to columns and vice versa.
    /// - returns: A matrix whose rows are the columns of *self* and vice versa.
    public func transpose() -> VariableSizeMatrix<MatrixType> {
        let dimensions = IntSize(rows: self.dimensions.columns, columns: self.dimensions.rows)
        let elements = pairs(0..<self.dimensions.columns, 0..<self.dimensions.rows)
            .map { row, column in self[column, row] }
        return VariableSizeMatrix(dimensions: dimensions, elements: elements)
    }
}

extension VariableSizeMatrix: ContinuousMatrix where MatrixType: ContinuousNumber {}

public func + <MatrixType>(lhs: VariableSizeMatrix<MatrixType>, rhs: MatrixType)
    -> VariableSizeMatrix<MatrixType>
{
    return VariableSizeMatrix(dimensions: lhs.dimensions, elements: lhs.elements.map { $0 + rhs })
}

public func + <MatrixType>(lhs: MatrixType, rhs: VariableSizeMatrix<MatrixType>)
    -> VariableSizeMatrix<MatrixType>
{
    return VariableSizeMatrix(dimensions: rhs.dimensions, elements: rhs.elements.map { lhs + $0 })
}

public func - <MatrixType>(lhs: VariableSizeMatrix<MatrixType>, rhs: MatrixType)
    -> VariableSizeMatrix<MatrixType>
{
    return VariableSizeMatrix(dimensions: lhs.dimensions, elements: lhs.elements.map { $0 - rhs })
}

public func - <MatrixType>(lhs: MatrixType, rhs: VariableSizeMatrix<MatrixType>)
    -> VariableSizeMatrix<MatrixType>
{
    return VariableSizeMatrix(dimensions: rhs.dimensions, elements: rhs.elements.map { lhs - $0 })
}

public func * <MatrixType>(lhs: VariableSizeMatrix<MatrixType>, rhs: MatrixType)
    -> VariableSizeMatrix<MatrixType>
{
    return VariableSizeMatrix(dimensions: lhs.dimensions, elements: lhs.elements.map { $0 * rhs })
}

public func * <MatrixType>(lhs: MatrixType, rhs: VariableSizeMatrix<MatrixType>)
    -> VariableSizeMatrix<MatrixType>
{
    return VariableSizeMatrix(dimensions: rhs.dimensions, elements: rhs.elements.map { lhs * $0 })
}

public func / <MatrixType>(lhs: VariableSizeMatrix<MatrixType>, rhs: MatrixType)
    -> VariableSizeMatrix<MatrixType> where MatrixType: ContinuousNumber
{
    return VariableSizeMatrix(dimensions: lhs.dimensions, elements: lhs.elements.map { $0 / rhs })
}

public func / <MatrixType>(lhs: MatrixType, rhs: VariableSizeMatrix<MatrixType>)
    -> VariableSizeMatrix<MatrixType> where MatrixType: ContinuousNumber
{
    return VariableSizeMatrix(dimensions: rhs.dimensions, elements: rhs.elements.map { lhs / $0 })
}

public func == <M, MatrixType>(lhs: VariableSizeMatrix<MatrixType>, rhs: M) -> Bool
where
    M: MatrixBase,
    VariableSizeMatrix<MatrixType>.ElementType == M.ElementType
{
    return lhs.dimensions == rhs.dimensions && lhs.elements == rhs.elements
}

extension VariableSizeMatrix: Decodable where MatrixType: Decodable {}
extension VariableSizeMatrix: Encodable where MatrixType: Encodable {}
extension VariableSizeMatrix: Sendable where MatrixType: Sendable {}
