//
//  ConstantSizeMatrix.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

///A matrix whose dimensions are determined at compile time.
public protocol ConstantSizeMatrix: MatrixBase {

    // MARK: - Required Implementations

    ///The dimensions of all instances of this type. The instance
    ///property *dimensions* must return this value.
    static var dimensions:IntPoint { get }

    ///Initializes this instance with the specified elements. If *elements* does not
    ///contain enough values, the remaining elements should be initialized to `Self.zero`.
    ///If *elements* contains too many elements, the extra values should be ignored.
    /// - parameter: an array of *ElementType* elements representing the elements of the matrix.
    /// - returns: a matrix initialized with the values of *elements*.
    init(elements:[ElementType])

    // MARK: - Optional Implementations

    ///The number of elements in the matrix. Must be equal to
    ///```Self.dimensions.row * Self.dimensions.column```.
    static var numberOfElements:Int { get }
}

// MARK: - Default Implementations

extension ConstantSizeMatrix {
    public static var numberOfElements:Int { return Self.dimensions.rows * Self.dimensions.columns }
    public var dimensions: IntPoint { return Self.dimensions }
}

