//
//  SizeTests.swift
//  CoronaErrors
//
//  Created by Cooper Knaak on 1/8/19.
//

import XCTest
@testable import CoronaMath

final class SizeTests: XCTestCase {

    func testInit() {
        let size = Size()
        XCTAssertEqual(size.components, [0.0, 0.0])
    }

    func testGetWidth() {
        let size = Size(components: [1.0, 2.0])
        XCTAssertEqual(size.width, 1.0)
    }

    func testSetWidth() {
        var size = Size(components: [1.0, 2.0])
        size.width = 3.0
        XCTAssertEqual(size.width, 3.0)
    }

    func testGetHeight() {
        let size = Size(components: [1.0, 2.0])
        XCTAssertEqual(size.height, 2.0)
    }

    func testSetHeight() {
        var size = Size(components: [1.0, 2.0])
        size.height = 3.0
        XCTAssertEqual(size.height, 3.0)
    }

    func testSubscriptGet() {
        let size = Size(components: [1.0, 2.0])
        XCTAssertEqual(size[0], 1.0)
    }

    func testSubscriptSet() {
        var size = Size(components: [1.0, 2.0])
        size[0] = 3.0
        XCTAssertEqual(size[0], 3.0)
    }

    func testCenterNonZero() {
        let size = Size(width: 10.0, height: 20.0)
        let expected = Point(x: 5.0, y: 10.0)
        XCTAssertEqual(size.center, expected)
    }

    func testCenterZero() {
        let size = Size(width: 0.0, height: 0.0)
        let expected = Point(x: 0.0, y: 0.0)
        XCTAssertEqual(size.center, expected)
    }

    func testCodable() {
        do {
            let size = Size(width: 3.0, height: 17.0)
            let data = try JSONEncoder().encode(size)
            let actual = try JSONDecoder().decode(Size.self, from: data)
            XCTAssertEqual(actual, size)
        } catch {
            XCTFail("Could not encode: \(error)")
        }
    }
}
