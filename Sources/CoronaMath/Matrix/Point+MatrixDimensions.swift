//
//  Point+MatrixDimensions.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 1/2/19.
//

import Foundation

///Extends PointBase to semantically represent a matrix's dimensions,
///exposing row and column properties.
extension PointBase {

    ///Initializes the point with the given value for `row` and `column`.
    /// - parameter row: The first component of the point.
    /// - parameter column: The second component of the point.
    public init(rows:VectorType, columns:VectorType) {
        self.init(x: rows, y: columns)
    }

    ///The first component of the point.
    public var rows:VectorType {
        get { return self.x }
        set { self.x = newValue }
    }
    ///The second component of the point.
    public var columns:VectorType {
        get { return self.y }
        set { self.y = newValue }
    }

}
