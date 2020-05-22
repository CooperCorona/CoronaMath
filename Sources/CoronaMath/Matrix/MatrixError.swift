//
//  MatrixError.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/27/18.
//

import Foundation
import CoronaErrors

///Errors than can occur during matrix operations.
public enum MatrixError: Swift.Error {
    ///A matrix (or array representing a matrix) has incorrect dimensions.
    case incorrectDimensions
}

public func require(dimensions dimensions1:IntSize, canMultiplyBy dimensions2:IntSize) throws {
    guard dimensions1.columns == dimensions2.rows else {
        throw ValueException<Int>.expected(value: dimensions1.columns, error: MatrixError .incorrectDimensions, actualValue: dimensions2.rows)
    }
}
