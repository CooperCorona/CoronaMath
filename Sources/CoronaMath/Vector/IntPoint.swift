//
//  IntPoint.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 9/13/20.
//

import Foundation

extension PointBase where VectorType: DiscreteNumber {

    public var row: VectorType {
        get { return self.y }
        set { self.y = newValue }
    }
    public var column: VectorType {
        get { return self.x }
        set { self.x = newValue }
    }

    public init(row: VectorType, column: VectorType) {
        self.init(x: column, y: row)
    }

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

/// Calculates a point for each pair of elements in `x` and `y`. `y` is iterated through first for each element of `x`.
/// Example:
/// ```
/// (0, 0), (0, 1), ... (0, m - 1),
/// (1, 0), (1, 1), ... (1, m - 1),
/// ...
/// (n - 1, 0), (n - 1, 1), ... (n - 1, m - 1)
/// ```
/// - parameter firstSequence: The first sequence to iterate through. Represents the x values of the points.
/// - parameter secondSequence: The second sequence to iterate through. Represents the y values of the points.
/// - returns: A lazy sequence of points for each pair of values in `x` and `y`.
public func pointPairs<T, U>(x firstSequence: T, y secondSequence: U) -> LazyMapSequence<
    PairIterator<T, U>, PointBase<T.Element>
>
where
    T: Sequence, T.Element: DiscreteNumber,
    U: Sequence, U.Element: DiscreteNumber,
    T.Element == U.Element
{
    return PairIterator(firstSequence: firstSequence, secondSequence: secondSequence).lazy.map {
        PointBase(x: $0.0, y: $0.1)
    }
}

/// Calculates a point for each pair of elements in `rows` and `columns`. `columns` is iterated through first for each element of `rows`.
/// Example:
/// ```
/// (0, 0), (0, 1), ... (0, columns - 1),
/// (1, 0), (1, 1), ... (1, columns - 1),
/// ...
/// (rows - 1, 0), (rows - 1, 1), ... (rows - 1, columns - 1)
/// ```
/// - parameter firstSequence: The first sequence to iterate through. Represents the x values of the points.
/// - parameter secondSequence: The second sequence to iterate through. Represents the y values of the points.
/// - returns: A lazy sequence of points for each pair of values in `rows` and `columns`.
public func pointPairs<T, U>(rows firstSequence: T, columns secondSequence: U) -> LazyMapSequence<
    PairIterator<T, U>, PointBase<T.Element>
>
where
    T: Sequence, T.Element: DiscreteNumber,
    U: Sequence, U.Element: DiscreteNumber,
    T.Element == U.Element
{
    return PairIterator(firstSequence: firstSequence, secondSequence: secondSequence).lazy.map {
        PointBase(row: $0.0, column: $0.1)
    }
}
