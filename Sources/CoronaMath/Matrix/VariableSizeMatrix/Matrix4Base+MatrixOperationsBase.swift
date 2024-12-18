//
//  Matrix4Base+MatrixOperationsBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 1/2/19.
//

import CoronaErrors
import Foundation

extension Matrix4Base: MatrixOperationsBase {

    public func multiply<M>(by matrix: M) throws -> VariableSizeMatrix<MatrixType>
    where
        M: MatrixBase,
        ElementType == M.ElementType
    {
        guard self.dimensions.columns == matrix.dimensions.rows else {
            throw ValueException<Int>.expected(
                value: self.dimensions.columns, error: MatrixError.incorrectDimensions,
                actualValue: matrix.dimensions.rows)
        }
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

}
extension Matrix4Base: ContinuousMatrix where MatrixType: ContinuousNumber {}
