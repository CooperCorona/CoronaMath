//
//  Matrix4Tests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 1/2/19.
//

import XCTest
@testable import CoronaMath

final class Matrix4Tests: XCTestCase {

    func testInitExactlyEnoughElements() {
        let matrix = Matrix4(elements: [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            4.0, 1.0, 2.0, 3.0
        ])
        XCTAssertEqual(matrix.elements, [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            4.0, 1.0, 2.0, 3.0
        ])
    }

    func testInitTooFewElements() {
        let matrix = Matrix4(elements: [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0
        ])
        XCTAssertEqual(matrix.elements, [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            0.0, 0.0, 0.0, 0.0
        ])
    }

    func testInitTooManyElements() {
        let matrix = Matrix4(elements: [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            4.0, 1.0, 2.0, 3.0,
            5.0, 6.0, 7.0, 8.0
        ])
        XCTAssertEqual(matrix.elements, [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            4.0, 1.0, 2.0, 3.0
        ])
    }

    func testNumberOfElements() {
        let matrix = Matrix4.identity
        XCTAssertEqual(Matrix4.numberOfElements, 16)
        XCTAssertEqual(matrix.numberOfElements, 16)
    }

    func testSubscriptIndex() {
        let matrix = Matrix4.identity
        XCTAssertEqual(matrix[0], 1.0)
        XCTAssertEqual(matrix[1], 0.0)
        XCTAssertEqual(matrix[2], 0.0)
        XCTAssertEqual(matrix[3], 0.0)
        XCTAssertEqual(matrix[4], 0.0)
        XCTAssertEqual(matrix[5], 1.0)
        XCTAssertEqual(matrix[6], 0.0)
        XCTAssertEqual(matrix[7], 0.0)
        XCTAssertEqual(matrix[8], 0.0)
        XCTAssertEqual(matrix[9], 0.0)
        XCTAssertEqual(matrix[10], 1.0)
        XCTAssertEqual(matrix[11], 0.0)
        XCTAssertEqual(matrix[12], 0.0)
        XCTAssertEqual(matrix[13], 0.0)
        XCTAssertEqual(matrix[14], 0.0)
        XCTAssertEqual(matrix[15], 1.0)
    }

    func testSubscriptRowColumn() {
        let matrix = Matrix4.identity
        XCTAssertEqual(matrix[0, 0], 1.0)
        XCTAssertEqual(matrix[0, 1], 0.0)
        XCTAssertEqual(matrix[0, 2], 0.0)
        XCTAssertEqual(matrix[0, 3], 0.0)
        XCTAssertEqual(matrix[1, 0], 0.0)
        XCTAssertEqual(matrix[1, 1], 1.0)
        XCTAssertEqual(matrix[1, 2], 0.0)
        XCTAssertEqual(matrix[1, 3], 0.0)
        XCTAssertEqual(matrix[2, 0], 0.0)
        XCTAssertEqual(matrix[2, 1], 0.0)
        XCTAssertEqual(matrix[2, 2], 1.0)
        XCTAssertEqual(matrix[2, 3], 0.0)
        XCTAssertEqual(matrix[3, 0], 0.0)
        XCTAssertEqual(matrix[3, 1], 0.0)
        XCTAssertEqual(matrix[3, 2], 0.0)
        XCTAssertEqual(matrix[3, 3], 1.0)
    }

    func testEquals() {
        let matrix1 = Matrix4(elements: [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            4.0, 1.0, 2.0, 3.0
        ])
        let matrix2 = Matrix4(elements: [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            4.0, 1.0, 2.0, 3.0
        ])
        XCTAssertEqual(matrix1, matrix2)
    }

    func testMultiply() {
        let matrix1 = Matrix4(elements: [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            4.0, 1.0, 2.0, 3.0
        ])
        let matrix2 = Matrix4(elements: [
            2.0, 0.0, 0.0, 0.0,
            0.0, 2.0, 0.0, 0.0,
            0.0, 0.0, 2.0, 0.0,
            0.0, 0.0, 0.0, 2.0
        ])
        let result = matrix1 * matrix2
        let expected = Matrix4(elements: [
            2.0, 4.0, 6.0, 8.0,
            4.0, 6.0, 8.0, 2.0,
            6.0, 8.0, 2.0, 4.0,
            8.0, 2.0, 4.0, 6.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testMultiplyAssign() {
        var matrix1 = Matrix4(elements: [
            1.0, 2.0, 3.0, 4.0,
            2.0, 3.0, 4.0, 1.0,
            3.0, 4.0, 1.0, 2.0,
            4.0, 1.0, 2.0, 3.0
            ])
        let matrix2 = Matrix4(elements: [
            2.0, 0.0, 0.0, 0.0,
            0.0, 2.0, 0.0, 0.0,
            0.0, 0.0, 2.0, 0.0,
            0.0, 0.0, 0.0, 2.0
            ])
        matrix1 *= matrix2
        let expected = Matrix4(elements: [
            2.0, 4.0, 6.0, 8.0,
            4.0, 6.0, 8.0, 2.0,
            6.0, 8.0, 2.0, 4.0,
            8.0, 2.0, 4.0, 6.0
        ])
        XCTAssertEqual(matrix1, expected)
    }
}
