//
//  RectTests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 1/8/19.
//

import XCTest
@testable import CoronaMath

final class RectTests: XCTestCase {

    func testInit() {
        let rect = Rect()
        XCTAssertEqual(rect.components, [0.0, 0.0, 0.0, 0.0])
    }

    func testGetX() {
        let rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(rect.x, 1.0)
    }

    func testSetX() {
        var rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        rect.x = 4.0
        XCTAssertEqual(rect.x, 4.0)
    }

    func testGetY() {
        let rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(rect.y, 2.0)
    }

    func testSetY() {
        var rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        rect.y = 4.0
        XCTAssertEqual(rect.y, 4.0)
    }

    func testGetWidth() {
        let rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(rect.width, 3.0)
    }

    func testSetWidth() {
        var rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        rect.width = 4.0
        XCTAssertEqual(rect.width, 4.0)
    }

    func testGetHeight() {
        let rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(rect.height, 0.0)
    }

    func testSetHeight() {
        var rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        rect.height = 4.0
        XCTAssertEqual(rect.height, 4.0)
    }

    func testGetOrigin() {
        let rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        let expected = Point(components: [1.0, 2.0])
        XCTAssertEqual(rect.origin, expected)
    }

    func testSetOrigin() {
        var rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        let expected = Point(components: [4.0, 5.0])
        rect.origin = expected
        XCTAssertEqual(rect.origin, expected)
    }

    func testGetSize() {
        let rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        let expected = Size(components: [3.0, 0.0])
        XCTAssertEqual(rect.size, expected)
    }

    func testSetSize() {
        var rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        let expected = Size(components: [4.0, 5.0])
        rect.size = expected
        XCTAssertEqual(rect.size, expected)
    }

    func testSubscriptGet() {
        let rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(rect[0], 1.0)
    }

    func testSubscriptSet() {
        var rect = Rect(components: [1.0, 2.0, 3.0, 0.0])
        rect[0] = 4.0
        XCTAssertEqual(rect[0], 4.0)
    }

    func testContainingPointsOnePoint() {
        let rect = Rect.containing(points: [Point(x: 1.0, y: 1.0)])
        let expected = Rect(x: 1.0, y: 1.0, width: 0.0, height: 0.0)
        XCTAssertEqual(rect, expected)
    }

    func testContainingPointsTwoPointsEqual() {
        let rect = Rect.containing(points: [
            Point(x: 1.0, y: 1.0),
            Point(x: 1.0, y: 1.0)
        ])
        let expected = Rect(x: 1.0, y: 1.0, width: 0.0, height: 0.0)
        XCTAssertEqual(rect, expected)
    }

    func testContainingPointsTwoPointsOrdered() {
        let rect = Rect.containing(points: [
            Point(x: 1.0, y: 1.0),
            Point(x: 4.0, y: 4.0)
        ])
        let expected = Rect(x: 1.0, y: 1.0, width: 3.0, height: 3.0)
        XCTAssertEqual(rect, expected)
    }

    func testContainingPointsTwoPointsOrderedXY() {
        let rect = Rect.containing(points: [
            Point(x: 1.0, y: 1.0),
            Point(x: 4.0, y: 4.0)
        ])
        let expected = Rect(x: 1.0, y: 1.0, width: 3.0, height: 3.0)
        XCTAssertEqual(rect, expected)
    }

    func testContainingPointsTwoPointsUnorderedXOrderedY() {
        let rect = Rect.containing(points: [
            Point(x: 4.0, y: 1.0),
            Point(x: 1.0, y: 4.0)
        ])
        let expected = Rect(x: 1.0, y: 1.0, width: 3.0, height: 3.0)
        XCTAssertEqual(rect, expected)
    }

    func testContainingPointsTwoPointsOrderedXUnorderedY() {
        let rect = Rect.containing(points: [
            Point(x: 1.0, y: 4.0),
            Point(x: 4.0, y: 1.0)
        ])
        let expected = Rect(x: 1.0, y: 1.0, width: 3.0, height: 3.0)
        XCTAssertEqual(rect, expected)
    }

    func testContainingPointsManyPoints() {
        let rect = Rect.containing(points: [
            Point(x: 1.0, y: 4.0),
            Point(x: 2.0, y: 3.0),
            Point(x: 0.0, y: 4.0),
            Point(x: 5.0, y: 1.0),
            Point(x: 2.0, y: 5.0)
        ])
        let expected = Rect(x: 0.0, y: 1.0, width: 5.0, height: 4.0)
        XCTAssertEqual(rect, expected)
    }

    func testCenterPositiveOriginPositiveSize() {
        let rect = Rect(x: 10.0, y: 20.0, width: 30.0, height: 40.0)
        let expected = Point(x: 25.0, y: 40.0)
        XCTAssertEqual(rect.center, expected)
    }

    func testCenterNegativeOriginPositiveSize() {
        let rect = Rect(x: -10.0, y: -20.0, width: 30.0, height: 40.0)
        let expected = Point(x: 5.0, y: 0.0)
        XCTAssertEqual(rect.center, expected)
    }

    func testCenterZeroOriginPositiveSize() {
        let rect = Rect(x: 0.0, y: 0.0, width: 30.0, height: 40.0)
        let expected = Point(x: 15.0, y: 20.0)
        XCTAssertEqual(rect.center, expected)
    }

    func testCenterPositiveOriginZeroSize() {
        let rect = Rect(x: 10.0, y: 20.0, width: 0.0, height: 0.0)
        let expected = Point(x: 10.0, y: 20.0)
        XCTAssertEqual(rect.center, expected)
    }

    func testCenterNegativeOriginZeroSize() {
        let rect = Rect(x: -10.0, y: -20.0, width: 0.0, height: 0.0)
        let expected = Point(x: -10.0, y: -20.0)
        XCTAssertEqual(rect.center, expected)
    }

    func testCenterZeroOriginZeroSize() {
        let rect = Rect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        let expected = Point(x: 0.0, y: 0.0)
        XCTAssertEqual(rect.center, expected)
    }

    func testInitCenterPositiveOriginPositiveSize() {
        let rect = Rect(center: Point(x: 25.0, y: 40.0), size: Size(width: 30.0, height: 40.0))
        let expected = Rect(x: 10.0, y: 20.0, width: 30.0, height: 40.0)
        XCTAssertEqual(rect, expected)
    }

    func testInitCenterNegativeOriginPositiveSize() {
        let rect = Rect(center: Point(x: 5.0, y: 0.0), size: Size(width: 30.0, height: 40.0))
        let expected = Rect(x: -10.0, y: -20.0, width: 30.0, height: 40.0)
        XCTAssertEqual(rect, expected)
    }

    func testInitCenterZeroOriginPositiveSize() {
        let rect = Rect(center: Point(x: 15.0, y: 20.0), size: Size(width: 30.0, height: 40.0))
        let expected = Rect(x: 0.0, y: 0.0, width: 30.0, height: 40.0)
        XCTAssertEqual(rect, expected)
    }

    func testInitCenterPositiveOriginZeroSize() {
        let rect = Rect(center: Point(x: 10.0, y: 20.0), size: Size(width: 0.0, height: 0.0))
        let expected = Rect(x: 10.0, y: 20.0, width: 0.0, height: 0.0)
        XCTAssertEqual(rect, expected)
    }

    func testInitCenterNegativeOriginZeroSize() {
        let rect = Rect(center: Point(x: -10.0, y: -20.0), size: Size(width: 0.0, height: 0.0))
        let expected = Rect(x: -10.0, y: -20.0, width: 0.0, height: 0.0)
        XCTAssertEqual(rect, expected)
    }

    func testInitCenterZeroOriginZeroSize() {
        let rect = Rect(center: Point(x: 0.0, y: 0.0), size: Size(width: 0.0, height: 0.0))
        let expected = Rect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        XCTAssertEqual(rect, expected)
    }

    func testPointsZeroSize() {
        let rect = Rect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        let expected = [
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 0.0),
            Point(x: 0.0, y: 0.0)
        ]
        XCTAssertEqual(rect.points, expected)
    }

    func testPointsPositiveSize() {
        let rect = Rect(x: 1.0, y: 2.0, width: 5.0, height: 7.0)
        let expected = [
            Point(x: 1.0, y: 2.0),
            Point(x: 1.0, y: 9.0),
            Point(x: 6.0, y: 2.0),
            Point(x: 6.0, y: 9.0)
        ]
        XCTAssertEqual(rect.points, expected)
    }
}
