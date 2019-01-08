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

}
