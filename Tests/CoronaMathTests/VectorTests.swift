//
//  VectorTests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 12/23/18.
//


import XCTest
@testable import CoronaMath

public final class VectorTests: XCTestCase {
    
    func testInitWithComponents() {
        let point = Point(components: [1.0, 2.0])
        XCTAssertEqual(point.components, [1.0, 2.0])
    }
    
    func testLength() {
        let point = Point(components: [3.0, 4.0])
        XCTAssertEqual(point.length(), 5.0)
    }
    
    func testUnit() {
        let point = Point(components: [3.0, 4.0])
        let result = Point(components: [3.0 / 5.0, 4.0 / 5.0])
        XCTAssertEqual(point.unit(), result)
    }
    
    func testDot() {
        let p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [3.0, 4.0])
        XCTAssertEqual(p1.dot(vector: p2), 11.0)
    }
    
    func testDotAllNegativeComponents() {
        let p1 = Point(components: [-1.0, -2.0])
        let p2 = Point(components: [-3.0, -4.0])
        XCTAssertEqual(p1.dot(vector: p2), 11.0)
    }
    
    func testDotSomeNegativeComponents() {
        let p1 = Point(components: [-1.0, 2.0])
        let p2 = Point(components: [3.0, -4.0])
        XCTAssertEqual(p1.dot(vector: p2), -11.0)
    }
    
    func testLengthNegativeComponents() {
        let point = Point(components: [-3.0, -4.0])
        XCTAssertEqual(point.length(), 5.0)
    }
    
    func testAdd() {
        let p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [3.0, 4.0])
        let result = Point(components: [4.0, 6.0])
        XCTAssertEqual(p1 + p2, result)
    }
    
    func testSubtract() {
        let p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [4.0, 6.0])
        let result = Point(components: [-3.0, -4.0])
        XCTAssertEqual(p1 - p2, result)
    }
    
    func testMultiply() {
        let p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [3.0, 4.0])
        let result = Point(components: [3.0, 8.0])
        XCTAssertEqual(p1 * p2, result)
    }
    
    func testDivide() {
        let p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [4.0, 16.0])
        let result = Point(components: [0.25, 0.125])
        XCTAssertEqual(p1 / p2, result)
    }
    
    func testAddAssign() {
        var p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [3.0, 4.0])
        p1 += p2
        let result = Point(components: [4.0, 6.0])
        XCTAssertEqual(p1, result)
    }
    
    func testSubtractAssign() {
        var p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [4.0, 6.0])
        p1 -= p2
        let result = Point(components: [-3.0, -4.0])
        XCTAssertEqual(p1, result)
    }
    
    func testMultiplyAssign() {
        var p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [3.0, 4.0])
        p1 *= p2
        let result = Point(components: [3.0, 8.0])
        XCTAssertEqual(p1, result)
    }
    
    func testDivideAssign() {
        var p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [4.0, 16.0])
        p1 /= p2
        let result = Point(components: [0.25, 0.125])
        XCTAssertEqual(p1, result)
    }
    
    func testAddScalarRight() {
        let p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        let result = Point(components: [4.0, 5.0])
        XCTAssertEqual(p1 + s, result)
    }
    
    func testAddScalarLeft() {
        let p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        let result = Point(components: [4.0, 5.0])
        XCTAssertEqual(s + p1, result)
    }
    
    func testSubtractScalarRight() {
        let p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        let result = Point(components: [-2.0, -1.0])
        XCTAssertEqual(p1 - s, result)
    }
    
    func testSubtractScalarLeft() {
        let p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        let result = Point(components: [2.0, 1.0])
        XCTAssertEqual(s - p1, result)
    }
    
    func testMultiplyScalarRight() {
        let p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        let result = Point(components: [3.0, 6.0])
        XCTAssertEqual(p1 * s, result)
    }
    
    func testMultiplyScalarLeft() {
        let p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        let result = Point(components: [3.0, 6.0])
        XCTAssertEqual(s * p1, result)
    }
    
    func testDivideScalarRight() {
        let p1 = Point(components: [1.0, 2.0])
        let s = 4.0
        let result = Point(components: [0.25, 0.5])
        XCTAssertEqual(p1 / s, result)
    }
    
    func testDivideScalarLeft() {
        let p1 = Point(components: [1.0, 2.0])
        let s = 4.0
        let result = Point(components: [4.0, 2.0])
        XCTAssertEqual(s / p1, result)
    }
    
    func testAddScalarAssign() {
        var p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        p1 += s
        let result = Point(components: [4.0, 5.0])
        XCTAssertEqual(p1, result)
    }
    
    func testSubtractScalarAssign() {
        var p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        p1 -= s
        let result = Point(components: [-2.0, -1.0])
        XCTAssertEqual(p1, result)
    }
    
    func testMultiplyScalarAssign() {
        var p1 = Point(components: [1.0, 2.0])
        let s = 3.0
        p1 *= s
        let result = Point(components: [3.0, 6.0])
        XCTAssertEqual(p1, result)
    }
    
    func testDivideScalarAssign() {
        var p1 = Point(components: [1.0, 2.0])
        let s = 4.0
        p1 /= s
        let result = Point(components: [0.25, 0.5])
        XCTAssertEqual(p1, result)
    }
    
    func testNegation() {
        let p1 = Point(components: [1.0, 2.0])
        let result = Point(components: [-1.0, -2.0])
        XCTAssertEqual(-p1, result)
    }
    
    func testNegationNegativeComponents() {
        let p1 = Point(components: [-1.0, -2.0])
        let result = Point(components: [1.0, 2.0])
        XCTAssertEqual(-p1, result)
    }
    
    func testEquals() {
        let p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [1.0, 2.0])
        XCTAssertEqual(p1, p2)
    }
    
    func testEqualsFalse() {
        let p1 = Point(components: [1.0, 2.0])
        let p2 = Point(components: [1.0, 3.0])
        XCTAssertNotEqual(p1, p2)
    }
    
}
