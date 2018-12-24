//
//  PointTests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 12/23/18.
//

import XCTest
@testable import CoronaMath

final class PointTests: XCTestCase {
    
    func testInit() {
        let point = Point()
        XCTAssertEqual(point.components, [0.0, 0.0])
    }
    
    func testGetX() {
        let point = Point(components: [1.0, 2.0])
        XCTAssertEqual(point.x, 1.0)
    }
    
    func testSetX() {
        var point = Point(components: [1.0, 2.0])
        point.x = 3.0
        XCTAssertEqual(point.x, 3.0)
    }
    
    func testGetY() {
        let point = Point(components: [1.0, 2.0])
        XCTAssertEqual(point.y, 2.0)
    }
    
    func testSetY() {
        var point = Point(components: [1.0, 2.0])
        point.y = 3.0
        XCTAssertEqual(point.y, 3.0)
    }
    
    func testSubscriptGet() {
        let point = Point(components: [1.0, 2.0])
        XCTAssertEqual(point[0], 1.0)
    }
    
    func testSubscriptSet() {
        var point = Point(components: [1.0, 2.0])
        point[0] = 3.0
        XCTAssertEqual(point[0], 3.0)
    }
    
}
