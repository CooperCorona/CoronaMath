//
//  Matrix3Tests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 1/2/19.
//

import XCTest
@testable import CoronaMath

final class Matrix3Tests: XCTestCase {

    func testInitExactNumberOfElements() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            3.0, 1.0, 2.0
        ])
        XCTAssertEqual(matrix.elements, [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            3.0, 1.0, 2.0
        ])
    }

    func testInitTooFewElements() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0
            ])
        XCTAssertEqual(matrix.elements, [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            0.0, 0.0, 0.0
        ])
    }

    func testInitTooManyElements() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            3.0, 1.0, 2.0,
            4.0, 5.0, 6.0
            ])
        XCTAssertEqual(matrix.elements, [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            3.0, 1.0, 2.0
        ])
    }

    func testNumberOfElements() {
        let matrix = Matrix3.identity
        XCTAssertEqual(Matrix3.numberOfElements, 9)
        XCTAssertEqual(matrix.numberOfElements, 9)
    }

    func testSubscriptIndex() {
        let matrix = Matrix3.identity
        XCTAssertEqual(matrix[0], 1.0)
        XCTAssertEqual(matrix[1], 0.0)
        XCTAssertEqual(matrix[2], 0.0)
        XCTAssertEqual(matrix[3], 0.0)
        XCTAssertEqual(matrix[4], 1.0)
        XCTAssertEqual(matrix[5], 0.0)
        XCTAssertEqual(matrix[6], 0.0)
        XCTAssertEqual(matrix[7], 0.0)
        XCTAssertEqual(matrix[8], 1.0)
    }

    func testSubscriptRowColumn() {
        let matrix = Matrix3.identity
        XCTAssertEqual(matrix[0, 0], 1.0)
        XCTAssertEqual(matrix[0, 1], 0.0)
        XCTAssertEqual(matrix[0, 2], 0.0)
        XCTAssertEqual(matrix[1, 0], 0.0)
        XCTAssertEqual(matrix[1, 1], 1.0)
        XCTAssertEqual(matrix[1, 2], 0.0)
        XCTAssertEqual(matrix[2, 0], 0.0)
        XCTAssertEqual(matrix[2, 1], 0.0)
        XCTAssertEqual(matrix[2, 2], 1.0)
    }

    func testEquals() {
        let matrix1 = Matrix3(elements: [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            3.0, 1.0, 2.0
        ])
        let matrix2 = Matrix3(elements: [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            3.0, 1.0, 2.0
        ])
        XCTAssertEqual(matrix1, matrix2)
    }

    func testMultiply() {
        let matrix1 = Matrix3(elements: [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            3.0, 1.0, 2.0
        ])
        let matrix2 = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = matrix1 * matrix2
        let expected = Matrix3(elements: [
            30.0, 36.0, 42.0,
            21.0, 27.0, 33.0,
            21.0, 27.0, 33.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testMultiplyAssign() {
        var matrix1 = Matrix3(elements: [
            1.0, 2.0, 3.0,
            2.0, 3.0, 1.0,
            3.0, 1.0, 2.0
            ])
        let matrix2 = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
            ])
        matrix1 *= matrix2
        let expected = Matrix3(elements: [
            30.0, 36.0, 42.0,
            21.0, 27.0, 33.0,
            21.0, 27.0, 33.0
        ])
        XCTAssertEqual(matrix1, expected)
    }

    func testTranspose() {
        let matrix1 = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = matrix1.transpose()
        let expected = Matrix3(elements: [
            1.0, 4.0, 7.0,
            2.0, 5.0, 8.0,
            3.0, 6.0, 9.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testAddScalarRight() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = matrix + 2.0
        let expected = Matrix3(elements: [
            3.0, 4.0, 5.0,
            6.0, 7.0, 8.0,
            9.0, 10.0, 11.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testAddScalarLeft() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = 2.0 + matrix
        let expected = Matrix3(elements: [
            3.0, 4.0, 5.0,
            6.0, 7.0, 8.0,
            9.0, 10.0, 11.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testAddScalarAssign() {
        var matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        matrix += 2.0
        let expected = Matrix3(elements: [
            3.0, 4.0, 5.0,
            6.0, 7.0, 8.0,
            9.0, 10.0, 11.0
        ])
        XCTAssertEqual(matrix, expected)
    }

    func testSubtractScalarRight() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = matrix - 2.0
        let expected = Matrix3(elements: [
            -1.0, 0.0, 1.0,
            2.0, 3.0, 4.0,
            5.0, 6.0, 7.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testSubtractScalarLeft() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = 2.0 - matrix
        let expected = Matrix3(elements: [
            1.0, 0.0, -1.0,
            -2.0, -3.0, -4.0,
            -5.0, -6.0, -7.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testSubtractScalarAssign() {
        var matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        matrix -= 2.0
        let expected = Matrix3(elements: [
            -1.0, 0.0, 1.0,
            2.0, 3.0, 4.0,
            5.0, 6.0, 7.0
        ])
        XCTAssertEqual(matrix, expected)
    }

    func testMultiplyScalarRight() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = matrix * 2.0
        let expected = Matrix3(elements: [
            2.0, 4.0, 6.0,
            8.0, 10.0, 12.0,
            14.0, 16.0, 18.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testMultiplyScalarLeft() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = 2.0 * matrix
        let expected = Matrix3(elements: [
            2.0, 4.0, 6.0,
            8.0, 10.0, 12.0,
            14.0, 16.0, 18.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testMultiplyScalarAssign() {
        var matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        matrix *= 2
        let expected = Matrix3(elements: [
            2.0, 4.0, 6.0,
            8.0, 10.0, 12.0,
            14.0, 16.0, 18.0
        ])
        XCTAssertEqual(matrix, expected)
    }

    func testDivideScalarRight() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        let result = matrix / 2.0
        let expected = Matrix3(elements: [
            0.5, 1.0, 1.5,
            2.0, 2.5, 3.0,
            3.5, 4.0, 4.5
        ])
        XCTAssertEqual(result, expected)
    }

    func testDivideScalarLeft() {
        let matrix = Matrix3(elements: [
            1.0, 2.0, 4.0,
            2.0, 4.0, 8.0,
            4.0, 8.0, 16.0
        ])
        let result = 2.0 / matrix
        let expected = Matrix3(elements: [
            2.0, 1.0, 0.5,
            1.0, 0.5, 0.25,
            0.5, 0.25, 0.125
        ])
        XCTAssertEqual(result, expected)
    }

    func testDivideScalarAssign() {
        var matrix = Matrix3(elements: [
            1.0, 2.0, 3.0,
            4.0, 5.0, 6.0,
            7.0, 8.0, 9.0
        ])
        matrix /= 2.0
        let expected = Matrix3(elements: [
            0.5, 1.0, 1.5,
            2.0, 2.5, 3.0,
            3.5, 4.0, 4.5
        ])
        XCTAssertEqual(matrix, expected)
    }
}
