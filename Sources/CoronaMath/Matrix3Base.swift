//
//  Matrix3Base.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/26/18.
//

import Foundation

extension PointBase where VectorType == Int {
    public init(rows:Int, columns:Int) {
        self.init(x: rows, y: columns)
    }
    public var row:Int {
        get { return self.x }
        set { self.x = newValue }
    }
    public var column:Int {
        get { return self.y }
        set { self.y = newValue }
    }
}

///A 3x3 matrix.
public struct Matrix3Base<MatrixType> where MatrixType: Addable & Multiplicable {

    public enum Error: Swift.Error { case IncorrectDimensions }
    public static var dimensions:IntPoint { return IntPoint(rows: 3, columns: 3) }

    public var elements = [
        MatrixType.one, MatrixType.zero, MatrixType.zero,
        MatrixType.zero, MatrixType.one, MatrixType.zero,
        MatrixType.zero, MatrixType.zero, MatrixType.one
    ]

    public init() {}
    
    public init(elements:[MatrixType]) throws {
        guard elements.count == Matrix3Base<MatrixType>.dimensions.row * Matrix3Base<MatrixType>.dimensions.column else {
            throw Error.IncorrectDimensions
        }
        self.elements = elements
    }
    
    public subscript(index:Int) -> MatrixType {
        get { return self.elements[index] }
        set { self.elements[index] = newValue }
    }
    
    public subscript(row:Int, column:Int) -> MatrixType {
        get { return self.elements[row * Matrix3Base.dimensions.x + column] }
        set { self.elements[row * Matrix3Base.dimensions.x + column] = newValue }
    }
    
}
