//
//  FloatingPointMatrix.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/27/18.
//

import Foundation

///A matrix whose elements are FloatingPoint.
public protocol FloatingPointMatrix: MatrixOperationsBase where ElementType: FloatingPoint {

    ///Divides a matrix by a scalar.
    /// - parameter lhs: The current matrix.
    /// - parameter rhs: The scalar to divide the elements.
    /// - returns: A matrix with dimensions equal to *lhs.dimensions* with
    ///all elements divided by *rhs*.
    static func /(lhs:Self, rhs:ElementType) -> Self
    ///Divides a scalar by a matrix.
    /// - parameter lhs: The scalar by which the matrix's elements are divided.
    /// - parameter rhs: The current matrix.
    /// - returns: A matrix with dimensions equal to *rhs.dimensions* with
    ///all elements dividing *lhs*.
    static func /(lhs:ElementType, rhs:Self) -> Self
    ///Divides and assigns a scalar and a matrix.
    /// - parameter lhs: The matrix to divide and assign.
    /// - parameter rhs; THe scalar to divide by.
    static func /=(lhs:inout Self, rhs:ElementType)

}

public func /=<M>(lhs:inout M, rhs:M.ElementType) where M: FloatingPointMatrix {
    lhs = lhs / rhs
}
