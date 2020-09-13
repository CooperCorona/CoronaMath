//
//  IntPointTests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 9/13/20.
//

import XCTest
@testable import CoronaMath

final class IntPointTests: XCTestCase {

    public func testAdjacentNeighbors() {
        let point = IntPoint(x: 3, y: 7)
        // Use Set for unordered comparison. adjacentNeighbors.count == 4
        // by inspection, so we know the method does not return duplicates.
        let adjacentNeighbors = Set([
            IntPoint(x: 2, y: 7),
            IntPoint(x: 4, y: 7),
            IntPoint(x: 3, y: 6),
            IntPoint(x: 3, y: 8),
        ])
        XCTAssertEqual(Set(point.adjacentNeighbors()), adjacentNeighbors)
    }

    public func testDiagonalNeighbors() {
        let point = IntPoint(x: 3, y: 7)
        let diagonalNeighbors = Set([
            IntPoint(x: 2, y: 6),
            IntPoint(x: 4, y: 6),
            IntPoint(x: 2, y: 8),
            IntPoint(x: 4, y: 8),
        ])
        XCTAssertEqual(Set(point.diagonalNeighbors()), diagonalNeighbors)
    }

    public func testAllNeighbors() {
        let point = IntPoint(x: 3, y: 7)
        let allNeighbors = Set([
            IntPoint(x: 2, y: 7),
            IntPoint(x: 4, y: 7),
            IntPoint(x: 3, y: 6),
            IntPoint(x: 3, y: 8),
            IntPoint(x: 2, y: 6),
            IntPoint(x: 4, y: 6),
            IntPoint(x: 2, y: 8),
            IntPoint(x: 4, y: 8),
        ])
        XCTAssertEqual(Set(point.allNeighbors()), allNeighbors)
    }
}
