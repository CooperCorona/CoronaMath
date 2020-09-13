//
//  IntPoint.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 9/13/20.
//

import Foundation

extension PointBase where VectorType: DiscreteNumber {

    ///Returns the 4 axis-aligned adjacent points to this point (left, right, bottom, top).
    public func adjacentNeighbors() -> [Self] {
        return [
            PointBase(x: self.x - VectorType.one, y: self.y),
            PointBase(x: self.x + VectorType.one, y: self.y),
            PointBase(x: self.x, y: self.y - VectorType.one),
            PointBase(x: self.x, y: self.y + VectorType.one),
        ]
    }

    ///Returns the 4 points touching the corners of this point (bottom-left, bottom-right, top-left, top-right).
    public func diagonalNeighbors() -> [Self] {
        return [
            PointBase(x: self.x - VectorType.one, y: self.y - VectorType.one),
            PointBase(x: self.x + VectorType.one, y: self.y - VectorType.one),
            PointBase(x: self.x - VectorType.one, y: self.y + VectorType.one),
            PointBase(x: self.x + VectorType.one, y: self.y + VectorType.one),
        ]
    }

    ///Returns the 8 axis-aligned or corner touching points to this point.
    public func allNeighbors() -> [Self] {
        return self.adjacentNeighbors() + self.diagonalNeighbors()
    }
}
