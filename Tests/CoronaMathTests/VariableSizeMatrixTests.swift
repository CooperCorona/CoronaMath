//
//  VariableSizeMatrixTests.swift
//  CoronaMathTests
//
//  Created by Cooper Knaak on 1/2/19.
//

import XCTest
@testable import CoronaMath

final class VariableSizeMatrixTests: XCTestCase {

    func testInitEmpty() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2))
        XCTAssertEqual(matrix.elements, [0.0, 0.0, 0.0, 0.0])
    }

    func testInitExactlyEnoughElements() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        XCTAssertEqual(matrix.elements, [1.0, 2.0, 3.0, 4.0])
    }

    func testInitTooFewElements() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0
        ])
        XCTAssertEqual(matrix.elements, [1.0, 2.0, 0.0, 0.0])
    }

    func testInitToManyElements() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0,
            5.0, 6.0
        ])
        XCTAssertEqual(matrix.elements, [1.0, 2.0, 3.0, 4.0])
    }

    func testSubscriptIndex() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        XCTAssertEqual(matrix[0], 1.0)
        XCTAssertEqual(matrix[1], 2.0)
        XCTAssertEqual(matrix[2], 3.0)
        XCTAssertEqual(matrix[3], 4.0)
    }

    func testSubscriptRowColumn() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 4, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0,
            5.0, 6.0,
            7.0, 8.0
        ])
        XCTAssertEqual(matrix[0, 0], 1.0)
        XCTAssertEqual(matrix[0, 1], 2.0)
        XCTAssertEqual(matrix[1, 0], 3.0)
        XCTAssertEqual(matrix[1, 1], 4.0)
        XCTAssertEqual(matrix[2, 0], 5.0)
        XCTAssertEqual(matrix[2, 1], 6.0)
        XCTAssertEqual(matrix[3, 0], 7.0)
        XCTAssertEqual(matrix[3, 1], 8.0)
    }

    func testEquals() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let matrix2 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        XCTAssertEqual(matrix1, matrix2)
    }

    func testEqualsDifferentDimensions() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let matrix2 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 4, columns: 1), elements: [
            1.0, 2.0, 3.0, 4.0
        ])
        XCTAssertNotEqual(matrix1, matrix2)
    }

    func testAdd() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let matrix2 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            5.0, 6.0,
            7.0, 8.0
        ])
        do {
            let result = try matrix1.add(by: matrix2)
            let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
                6.0, 8.0,
                10.0, 12.0
            ])
            XCTAssertEqual(result, expected)
        } catch {
            XCTFail("Threw exception: \(error)")
        }
    }

    func testAddDifferentDimensions() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let matrix2 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 4, columns: 1), elements: [
            1.0, 2.0, 3.0, 4.0
        ])
        do {
            let result = try matrix1.add(by: matrix2)
            XCTFail("Failed to throw exception. Result: \(result)")
        } catch {
            //add should throw an exception, so reaching this point
            //means the test should pass.
        }
    }

    func testSubtract() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let matrix2 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            5.0, 4.0,
            3.0, 1.0
        ])
        do {
            let result = try matrix1.subtract(by: matrix2)
            let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
                -4.0, -2.0,
                0.0, 3.0
                ])
            XCTAssertEqual(result, expected)
        } catch {
            XCTFail("Threw exception: \(error)")
        }
    }

    func testSubtractDifferentDimensions() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
            ])
        let matrix2 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 4, columns: 1), elements: [
            1.0, 2.0, 3.0, 4.0
            ])
        do {
            let result = try matrix1.subtract(by: matrix2)
            XCTFail("Failed to throw exception. Result: \(result)")
        } catch {
            //subtract should throw an exception, so reaching this point
            //means the test should pass.
        }
    }

    func testMultiply() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 3), elements: [
            5.0, 4.0, 2.0,
            3.0, 1.0, 6.0
        ])
        let matrix2 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 3, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0,
            5.0, 6.0
        ])
        do {
            let result = try matrix1.multiply(by: matrix2)
            let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
                27.0, 38.0,
                36.0, 46.0
            ])
            XCTAssertEqual(result, expected)
        } catch {
            XCTFail("Threw exception: \(error)")
        }
    }

    func testMultiplyIncorrectDimensions() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 3, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0,
            5.0, 6.0
        ])
        let matrix2 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 3, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0,
            5.0, 6.0
        ])
        do {
            let result = try matrix1.multiply(by: matrix2)
            XCTFail("Failed to throw exception. Result: \(result)")
        } catch {
            //multiply should throw an exception, so reaching this point
            //means the test should pass.
        }
    }

    func testTransposeRowsGreaterThanColumns() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 3, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0,
            5.0, 6.0
        ])
        let result = matrix1.transpose()
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 3), elements: [
            1.0, 3.0, 5.0,
            2.0, 4.0, 6.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testTransposeColumnsGreaterThanRows() {
        let matrix1 = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 3), elements: [
            1.0, 2.0, 4.0,
            8.0, 16.0, 32.0
        ])
        let result = matrix1.transpose()
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 3, columns: 2), elements: [
            1.0, 8.0,
            2.0, 16.0,
            4.0, 32.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testAddScalarRight() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let result = matrix + 2.0
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            3.0, 4.0,
            5.0, 6.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testAddScalarLeft() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let result = 2.0 + matrix
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            3.0, 4.0,
            5.0, 6.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testAddScalarAssign() {
        var matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
            ])
        matrix += 2.0
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            3.0, 4.0,
            5.0, 6.0
        ])
        XCTAssertEqual(matrix, expected)
    }

    func testSubtractScalarRight() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let result = matrix - 2.0
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            -1.0, 0.0,
            1.0, 2.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testSubtractScalarLeft() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let result = 2.0 - matrix
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 0.0,
            -1.0, -2.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testSubtractScalarAssign() {
        var matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        matrix -= 2.0
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            -1.0, 0.0,
            1.0, 2.0
        ])
        XCTAssertEqual(matrix, expected)
    }

    func testMultiplyScalarRight() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let result = matrix * 2.0
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            2.0, 4.0,
            6.0, 8.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testMultiplyScalarLeft() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let result = 2.0 * matrix
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            2.0, 4.0,
            6.0, 8.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testMultiplyScalarAssign() {
        var matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        matrix *= 2.0
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            2.0, 4.0,
            6.0, 8.0
        ])
        XCTAssertEqual(matrix, expected)
    }

    func testDivideScalarRight() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        let result = matrix / 2.0
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            0.5, 1.0,
            1.5, 2.0
        ])
        XCTAssertEqual(result, expected)
    }

    func testDivideScalarLeft() {
        let matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            4.0, 8.0
            ])
        let result = 2.0 / matrix
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            2.0, 1.0,
            0.5, 0.25
        ])
        XCTAssertEqual(result, expected)
    }

    func testDivideScalarAssign() {
        var matrix = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            1.0, 2.0,
            3.0, 4.0
        ])
        matrix /= 2.0
        let expected = VariableSizeMatrix<Double>(dimensions: IntPoint(rows: 2, columns: 2), elements: [
            0.5, 1.0,
            1.5, 2.0
        ])
        XCTAssertEqual(matrix, expected)
    }
}
