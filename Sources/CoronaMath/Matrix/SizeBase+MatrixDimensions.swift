//
//  SizeBase+MatrixDimensions.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 1/2/19.
//

import Foundation

///Extends SizeBase to semantically represent a matrix's dimensions,
///exposing row and column properties.
extension SizeBase {

    ///Initializes the size with the given value for `row` and `column`.
    /// - parameter row: The first component of the size.
    /// - parameter column: The second component of the size.
    public init(rows:VectorType, columns:VectorType) {
        self.init(width: rows, height: columns)
    }

    ///The first component of the size.
    public var rows:VectorType {
        get { return self.width }
        set { self.width = newValue }
    }
    ///The second component of the size.
    public var columns:VectorType {
        get { return self.height }
        set { self.height = newValue }
    }

}
