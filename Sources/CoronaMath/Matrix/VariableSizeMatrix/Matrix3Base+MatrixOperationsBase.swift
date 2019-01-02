//
//  Matrix3Base+MatrixOperationsBase.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 1/2/19.
//

import Foundation

extension Matrix3Base: MatrixOperationsBase {

    public func multiply<M>(by matrix: M) throws -> VariableSizeMatrix<MatrixType> where
        M: MatrixBase,
        ElementType == M.ElementType {
            guard self.dimensions.column == matrix.dimensions.row else {
                throw MatrixError.incorrectDimensions
            }
            let dimensions = IntPoint(rows: self.dimensions.row, columns: matrix.dimensions.column)
            var elements:[M.ElementType] = []
            for row in 0..<dimensions.row {
                for column in 0..<dimensions.column {
                    var value = M.ElementType.zero
                    for i in 0..<self.dimensions.column {
                        value = value + self[row, i] * matrix[i, column]
                    }
                    elements.append(value)
                }
            }
            return VariableSizeMatrix(dimensions: dimensions, elements: elements)
    }

}
extension Matrix3Base: FloatingPointMatrix where MatrixType: FloatingPoint {}
