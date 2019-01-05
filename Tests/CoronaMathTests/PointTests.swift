//
//  PointTests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 12/23/18.
//

import XCTest
@testable import CoronaMath

final class PointTests: XCTestCase {

    func testMakePairs() {
        let array = [1, 2, 3]
        let sequence = array.makePairs().map() { $0 }
        XCTAssertEqual(sequence.count, 9)

        XCTAssertEqual(sequence[0].0, 1)
        XCTAssertEqual(sequence[0].1, 1)

        XCTAssertEqual(sequence[1].0, 1)
        XCTAssertEqual(sequence[1].1, 2)

        XCTAssertEqual(sequence[2].0, 1)
        XCTAssertEqual(sequence[2].1, 3)

        XCTAssertEqual(sequence[3].0, 2)
        XCTAssertEqual(sequence[3].1, 1)

        XCTAssertEqual(sequence[4].0, 2)
        XCTAssertEqual(sequence[4].1, 2)

        XCTAssertEqual(sequence[5].0, 2)
        XCTAssertEqual(sequence[5].1, 3)

        XCTAssertEqual(sequence[6].0, 3)
        XCTAssertEqual(sequence[6].1, 1)

        XCTAssertEqual(sequence[7].0, 3)
        XCTAssertEqual(sequence[7].1, 2)

        XCTAssertEqual(sequence[8].0, 3)
        XCTAssertEqual(sequence[8].1, 3)
    }

    func testMakePairsEmpty() {
        let array:[Int] = []
        let sequence = array.makePairs().map() { $0 }
        XCTAssertEqual(sequence.count, 0)
    }

    func testMakePairsSingle() {
        let array:[Int] = [2]
        let sequence = array.makePairs().map() { $0 }
        XCTAssertEqual(sequence.count, 1)
        XCTAssertEqual(sequence[0].0, 2)
        XCTAssertEqual(sequence[0].1, 2)
    }

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
