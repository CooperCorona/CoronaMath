//
//  Vector3Tests.swift
//  CoronaMath
//
//  Created by Cooper Knaak on 12/24/18.
//

import XCTest
@testable import CoronaMath

final class Vector3Tests: XCTestCase {
    
    func testInit() {
        let vector = Vector3()
        XCTAssertEqual(vector.components, [0.0, 0.0, 0.0])
    }
    
    func testGetX() {
        let vector = Vector3(components: [1.0, 2.0, 3.0])
        XCTAssertEqual(vector.x, 1.0)
    }
    
    func testSetX() {
        var vector = Vector3(components: [1.0, 2.0, 3.0])
        vector.x = 4.0
        XCTAssertEqual(vector.x, 4.0)
    }
    
    func testGetY() {
        let vector = Vector3(components: [1.0, 2.0, 3.0])
        XCTAssertEqual(vector.y, 2.0)
    }
    
    func testSetY() {
        var vector = Vector3(components: [1.0, 2.0, 3.0])
        vector.y = 4.0
        XCTAssertEqual(vector.y, 4.0)
    }
    
    func testGetZ() {
        let vector = Vector3(components: [1.0, 2.0, 3.0])
        XCTAssertEqual(vector.z, 3.0)
    }
    
    func testSetZ() {
        var vector = Vector3(components: [1.0, 2.0, 3.0])
        vector.z = 4.0
        XCTAssertEqual(vector.z, 4.0)
    }
    
    func testGetR() {
        let vector = Vector3(components: [1.0, 0.5, 0.0])
        XCTAssertEqual(vector.r, 1.0)
    }
    
    func testSetR() {
        var vector = Vector3(components: [1.0, 0.5, 0.0])
        vector.r = 0.25
        XCTAssertEqual(vector.r, 0.25)
    }
    
    func testGetG() {
        let vector = Vector3(components: [1.0, 0.5, 0.0])
        XCTAssertEqual(vector.g, 0.5)
    }
    
    func testSetG() {
        var vector = Vector3(components: [1.0, 0.5, 0.0])
        vector.g = 0.25
        XCTAssertEqual(vector.g, 0.25)
    }
    
    func testGetB() {
        let vector = Vector3(components: [1.0, 0.5, 0.0])
        XCTAssertEqual(vector.b, 0.0)
    }
    
    func testSetB() {
        var vector = Vector3(components: [1.0, 0.5, 0.0])
        vector.b = 0.25
        XCTAssertEqual(vector.b, 0.25)
    }
    
    func testGetRed() {
        let vector = Vector3(components: [1.0, 0.5, 0.0])
        XCTAssertEqual(vector.red, 1.0)
    }
    
    func testSetRed() {
        var vector = Vector3(components: [1.0, 0.5, 0.0])
        vector.red = 0.25
        XCTAssertEqual(vector.red, 0.25)
    }
    
    func testGetGreen() {
        let vector = Vector3(components: [1.0, 0.5, 0.0])
        XCTAssertEqual(vector.green, 0.5)
    }
    
    func testSetGreen() {
        var vector = Vector3(components: [1.0, 0.5, 0.0])
        vector.green = 0.25
        XCTAssertEqual(vector.green, 0.25)
    }
    
    func testGetBlue() {
        let vector = Vector3(components: [1.0, 0.5, 0.0])
        XCTAssertEqual(vector.blue, 0.0)
    }
    
    func testSetBlue() {
        var vector = Vector3(components: [1.0, 0.5, 0.0])
        vector.blue = 0.25
        XCTAssertEqual(vector.blue, 0.25)
    }
    
    func testSubscriptGet() {
        let vector = Vector3(components: [1.0, 2.0, 3.0])
        XCTAssertEqual(vector[0], 1.0)
    }
    
    func testSubscriptSet() {
        var vector = Vector3(components: [1.0, 2.0, 3.0])
        vector[0] = 4.0
        XCTAssertEqual(vector[0], 4.0)
    }
    
    func testCross() {
        XCTAssertEqual(Vector3.unitX.cross(vector: Vector3.unitY), Vector3.unitZ)
    }
    
    func testCrossReversed() {
        XCTAssertEqual(Vector3.unitY.cross(vector: Vector3.unitX), -Vector3.unitZ)
    }
    
    func testCrossRandomComponents() {
        let v1 = Vector3(components: [1.0, 2.0, 3.0])
        let v2 = Vector3(components: [4.0, 5.0, 6.0])
        let result = Vector3(components: [-3.0, 6.0, -3.0])
        XCTAssertEqual(v1.cross(vector: v2), result)
    }

    func testMultiplyMatrix3() {
        let v = Vector3(components: [1.0, 2.0, 3.0])
        let m = Matrix3(elements: [
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0,
            10.0, 11.0, 12.0
        ])
        let result = Vector3(components: [32.0, 50.0, 68.0])
        XCTAssertEqual(m * v, result)
    }

    func testCodable() {
        do {
            let point = Vector3(x: 3.0, y: 17.0, z: 11.0)
            let data = try JSONEncoder().encode(point)
            let actual = try JSONDecoder().decode(Vector3.self, from: data)
            XCTAssertEqual(actual, point)
        } catch {
            XCTFail("Could not encode: \(error)")
        }
    }
    
}

