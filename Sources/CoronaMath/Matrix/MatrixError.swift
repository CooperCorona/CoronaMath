//
//  MatrixError.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/27/18.
//

import Foundation

///Errors than can occur during matrix operations.
public enum MatrixError: Swift.Error {
    ///A matrix (or array representing a matrix) has incorrect dimensions.
    case incorrectDimensions
}
