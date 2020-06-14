//
//  PointTests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 12/23/18.
//

import XCTest
@testable import CoronaMath

final class PointTests: XCTestCase {

    let epsilon = 0.000001

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

    func testAngle() {
        let point = Point(x: 1.0, y: 1.0)
        XCTAssertEqual(point.angle(), Double.pi / 4.0, accuracy: epsilon)
    }

    func testAngleTo180() {
        let point1 = Point(x: 1.0, y: 1.0)
        let point2 = Point(x: -1.0, y: 1.0)
        XCTAssertEqual(point1.angle(to: point2), Double.pi, accuracy: epsilon)
    }

    func testInitWithAngleUnit0() {
        let point = Point(angle: 0.0)
        let expected = Point(x: 1.0, y: 0.0)
        // Trig functions are more likely to introduce floating point errors, so they need
        // to use the accuracy parameter.
        XCTAssertEqual(point.x, expected.x, accuracy: self.epsilon)
        XCTAssertEqual(point.y, expected.y, accuracy: self.epsilon)
    }

    func testInitWithAngle180Unit() {
        let point = Point(angle: Double.pi)
        let expected = Point(x: -1.0, y: 0.0)
        XCTAssertEqual(point.x, expected.x, accuracy: self.epsilon)
        XCTAssertEqual(point.y, expected.y, accuracy: self.epsilon)
    }

    func testInitWithAnglePositive90() {
        let point = Point(angle: Double.pi / 2.0, length: 4.0)
        let expected = Point(x: 0.0, y: 4.0)
        XCTAssertEqual(point.x, expected.x, accuracy: self.epsilon)
        XCTAssertEqual(point.y, expected.y, accuracy: self.epsilon)
    }

    func testInitWithAngleNegative270() {
        let point = Point(angle: 3.0 * Double.pi / 2.0, length: -3.0)
        let expected = Point(x: 0.0, y: 3.0)
        XCTAssertEqual(point.x, expected.x, accuracy: self.epsilon)
        XCTAssertEqual(point.y, expected.y, accuracy: self.epsilon)
    }

    func testMultiplyMatrix3Identity() {
        let point = Point(x: 10.0, y: 20.0)
        let matrix = Matrix3.identity
        let expected = point
        XCTAssertEqual(matrix * point, expected)
    }

    func testMultiplyMatrix3Translation() {
        let point = Point(x: 10.0, y: 20.0)
        let matrix = Matrix3(translation: Point(x: -30.0, y: -50.0), scale: Point(x: 1.0, y: 1.0), rotation: 0.0)
        let expected = Point(x: -20.0, y: -30.0)
        XCTAssertEqual(matrix * point, expected)
    }

    func testMultiplyMatrix3Scale() {
        let point = Point(x: -10.0, y: 20.0)
        let matrix = Matrix3(translation: Point(x: 0.0, y: 0.0), scale: Point(x: 2.0, y: 3.0), rotation: 0.0)
        let expected = Point(x: -20.0, y: 60.0)
        XCTAssertEqual(matrix * point, expected)
    }

    func testMultiplyMatrix3Rotation() {
        let point = Point(x: -10.0, y: 20.0)
        let matrix = Matrix3(translation: Point.zero, scale: Point(x: 1.0, y: 1.0), rotation: Double.pi / 2.0)
        let expected = Point(x: -20.0, y: -10.0)
        let actual = matrix * point
        XCTAssertEqual(actual.x, expected.x, accuracy: self.epsilon)
        XCTAssertEqual(actual.y, expected.y, accuracy: self.epsilon)
    }

    func testMultiplyMatrix3ModelMatrix() {
        let point = Point(x: 10.0, y: 20.0)
        let matrix = Matrix3(translation: Point(x: 2.0, y: -4.0), scale: Point(x: 2.0, y: 3.0), rotation: Double.pi / 2.0, anchor: Point(xy: 0.5), size: Size(width: 10.0, height: 20.0))
        let actual = matrix * point
        let expected = Point(x: -18.0, y: 11.0)
        XCTAssertEqual(actual.x, expected.x, accuracy: self.epsilon)
        XCTAssertEqual(actual.y, expected.y, accuracy: self.epsilon)
    }

    func testCodable() {
        do {
            let point = Point(x: 3.0, y: 17.0)
            let data = try JSONEncoder().encode(point)
            let actual = try JSONDecoder().decode(Point.self, from: data)
            XCTAssertEqual(actual, point)
        } catch {
            XCTFail("Could not encode: \(error)")
        }
    }

    func testSize() {
        let point = Point(x: 3.0, y: 17.0)
        let expected = Size(width: 3.0, height: 17.0)
        XCTAssertEqual(point.size(), expected)
    }

    func testPlusSize() {
        let point = Point(x: 3.0, y: 17.0)
        let size = Size(width: 2.0, height: 5.0)
        let expected = Point(x: 5.0, y: 22.0)
        XCTAssertEqual(point + size, expected)
    }

    func testMinusSize() {
        let point = Point(x: 3.0, y: 17.0)
        let size = Size(width: 2.0, height: 5.0)
        let expected = Point(x: 1.0, y: 12.0)
        XCTAssertEqual(point - size, expected)
    }

    func testMultiplySize() {
        let point = Point(x: 3.0, y: 17.0)
        let size = Size(width: 2.0, height: 5.0)
        let expected = Point(x: 6.0, y: 85.0)
        XCTAssertEqual(point * size, expected)
    }

    func testDivideSize() {
        let point = Point(x: 3.0, y: 17.0)
        let size = Size(width: 2.0, height: 5.0)
        let expected = Point(x: 1.5, y: 3.4)
        XCTAssertEqual(point / size, expected)
    }
}
