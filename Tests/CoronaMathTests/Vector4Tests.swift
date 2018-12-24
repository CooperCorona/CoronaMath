//
//  Vector4Tests.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import XCTest
@testable import CoronaMath

final class Vector4Tests: XCTestCase {
    
    func testInit() {
        let vector = Vector4()
        XCTAssertEqual(vector.components, [0.0, 0.0, 0.0, 0.0])
    }
    
    func testGetX() {
        let vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(vector.x, 1.0)
    }
    
    func testSetX() {
        var vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        vector.x = 4.0
        XCTAssertEqual(vector.x, 4.0)
    }
    
    func testGetY() {
        let vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(vector.y, 2.0)
    }
    
    func testSetY() {
        var vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        vector.y = 4.0
        XCTAssertEqual(vector.y, 4.0)
    }
    
    func testGetZ() {
        let vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(vector.z, 3.0)
    }
    
    func testSetZ() {
        var vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        vector.z = 4.0
        XCTAssertEqual(vector.z, 4.0)
    }
    
    func testGetW() {
        let vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(vector.w, 0.0)
    }
    
    func testSetW() {
        var vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        vector.w = 4.0
        XCTAssertEqual(vector.w, 4.0)
    }
    
    func testGetR() {
        let vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        XCTAssertEqual(vector.r, 1.0)
    }
    
    func testSetR() {
        var vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        vector.r = 0.25
        XCTAssertEqual(vector.r, 0.25)
    }
    
    func testGetG() {
        let vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        XCTAssertEqual(vector.g, 0.5)
    }
    
    func testSetG() {
        var vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        vector.g = 0.25
        XCTAssertEqual(vector.g, 0.25)
    }
    
    func testGetB() {
        let vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        XCTAssertEqual(vector.b, 0.0)
    }
    
    func testSetB() {
        var vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        vector.b = 0.25
        XCTAssertEqual(vector.b, 0.25)
    }
    
    func testGetA() {
        let vector = Vector4(components: [1.0, 0.5, 0.0, 0.125])
        XCTAssertEqual(vector.a, 0.125)
    }
    
    func testSetA() {
        var vector = Vector4(components: [1.0, 0.5, 0.0, 0.125])
        vector.a = 1.0
        XCTAssertEqual(vector.a, 1.0)
    }
    
    func testGetRed() {
        let vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        XCTAssertEqual(vector.red, 1.0)
    }
    
    func testSetRed() {
        var vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        vector.red = 0.25
        XCTAssertEqual(vector.red, 0.25)
    }
    
    func testGetGreen() {
        let vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        XCTAssertEqual(vector.green, 0.5)
    }
    
    func testSetGreen() {
        var vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        vector.green = 0.25
        XCTAssertEqual(vector.green, 0.25)
    }
    
    func testGetBlue() {
        let vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        XCTAssertEqual(vector.blue, 0.0)
    }
    
    func testSetBlue() {
        var vector = Vector4(components: [1.0, 0.5, 0.0, 0.0])
        vector.blue = 0.25
        XCTAssertEqual(vector.blue, 0.25)
    }
    
    func testGetAlpha() {
        let vector = Vector4(components: [1.0, 0.5, 0.0, 0.125])
        XCTAssertEqual(vector.alpha, 0.125)
    }
    
    func testSetAlpha() {
        var vector = Vector4(components: [1.0, 0.5, 0.0, 0.125])
        vector.alpha = 1.0
        XCTAssertEqual(vector.alpha, 1.0)
    }
    
    func testSubscriptGet() {
        let vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        XCTAssertEqual(vector[0], 1.0)
    }
    
    func testSubscriptSet() {
        var vector = Vector4(components: [1.0, 2.0, 3.0, 0.0])
        vector[0] = 4.0
        XCTAssertEqual(vector[0], 4.0)
    }
    
}
