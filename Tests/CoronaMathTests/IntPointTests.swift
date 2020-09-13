//
//  IntPointTests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 9/13/20.
//

import XCTest
@testable import CoronaMath

final class IntPointTests: XCTestCase {

    public func testInitRowColumn() {
        let point = IntPoint(row: 3, column: 7)
        let expected = IntPoint(x: 7, y: 3)
        XCTAssertEqual(point, expected)
    }

    public func testGetRow() {
        let point = IntPoint(x: 3, y: 7)
        XCTAssertEqual(point.row, 7)
    }

    public func testSetRow() {
        var point = IntPoint(x: 3, y: 7)
        point.row = 11
        XCTAssertEqual(point.row, 11)
    }

    public func testGetColumn() {
        let point = IntPoint(x: 3, y: 7)
        XCTAssertEqual(point.column, 3)
    }

    public func testSetColumn() {
        var point = IntPoint(x: 3, y: 7)
        point.column = 11
        XCTAssertEqual(point.column, 11)
    }

    public func testPointPairsXY() {
        let sequence = pointPairs(x: 1..<4, y: 3..<7)
        let expected = [
            IntPoint(x: 1, y: 3),
            IntPoint(x: 1, y: 4),
            IntPoint(x: 1, y: 5),
            IntPoint(x: 1, y: 6),
            IntPoint(x: 2, y: 3),
            IntPoint(x: 2, y: 4),
            IntPoint(x: 2, y: 5),
            IntPoint(x: 2, y: 6),
            IntPoint(x: 3, y: 3),
            IntPoint(x: 3, y: 4),
            IntPoint(x: 3, y: 5),
            IntPoint(x: 3, y: 6),
        ]
        for (i, element) in sequence.enumerated() {
            XCTAssertEqual(element, expected[i])
        }
    }

    public func testPointPairsRowsColumns() {
        let sequence = pointPairs(rows: 1..<4, columns: 3..<7)
        let expected = [
            IntPoint(row: 1, column: 3),
            IntPoint(row: 1, column: 4),
            IntPoint(row: 1, column: 5),
            IntPoint(row: 1, column: 6),
            IntPoint(row: 2, column: 3),
            IntPoint(row: 2, column: 4),
            IntPoint(row: 2, column: 5),
            IntPoint(row: 2, column: 6),
            IntPoint(row: 3, column: 3),
            IntPoint(row: 3, column: 4),
            IntPoint(row: 3, column: 5),
            IntPoint(row: 3, column: 6),
        ]
        for (i, element) in sequence.enumerated() {
            XCTAssertEqual(element, expected[i])
        }
    }

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
