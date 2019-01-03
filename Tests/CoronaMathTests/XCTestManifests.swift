import XCTest

extension Matrix3Tests {
    static let __allTests = [
        ("testAddScalarAssign", testAddScalarAssign),
        ("testAddScalarLeft", testAddScalarLeft),
        ("testAddScalarRight", testAddScalarRight),
        ("testDivideScalarAssign", testDivideScalarAssign),
        ("testDivideScalarLeft", testDivideScalarLeft),
        ("testDivideScalarRight", testDivideScalarRight),
        ("testEquals", testEquals),
        ("testInitExactNumberOfElements", testInitExactNumberOfElements),
        ("testInitTooFewElements", testInitTooFewElements),
        ("testInitTooManyElements", testInitTooManyElements),
        ("testMultiply", testMultiply),
        ("testMultiplyAssign", testMultiplyAssign),
        ("testMultiplyScalarAssign", testMultiplyScalarAssign),
        ("testMultiplyScalarLeft", testMultiplyScalarLeft),
        ("testMultiplyScalarRight", testMultiplyScalarRight),
        ("testNumberOfElements", testNumberOfElements),
        ("testSubscriptIndex", testSubscriptIndex),
        ("testSubscriptRowColumn", testSubscriptRowColumn),
        ("testSubtractScalarAssign", testSubtractScalarAssign),
        ("testSubtractScalarLeft", testSubtractScalarLeft),
        ("testSubtractScalarRight", testSubtractScalarRight),
        ("testTranspose", testTranspose),
    ]
}

extension Matrix4Tests {
    static let __allTests = [
        ("testEquals", testEquals),
        ("testInitExactlyEnoughElements", testInitExactlyEnoughElements),
        ("testInitTooFewElements", testInitTooFewElements),
        ("testInitTooManyElements", testInitTooManyElements),
        ("testMultiply", testMultiply),
        ("testMultiplyAssign", testMultiplyAssign),
        ("testNumberOfElements", testNumberOfElements),
        ("testSubscriptIndex", testSubscriptIndex),
        ("testSubscriptRowColumn", testSubscriptRowColumn),
    ]
}

extension PointTests {
    static let __allTests = [
        ("testGetX", testGetX),
        ("testGetY", testGetY),
        ("testInit", testInit),
        ("testSetX", testSetX),
        ("testSetY", testSetY),
        ("testSubscriptGet", testSubscriptGet),
        ("testSubscriptSet", testSubscriptSet),
    ]
}

extension VariableSizeMatrixTests {
    static let __allTests = [
        ("testAdd", testAdd),
        ("testAddDifferentDimensions", testAddDifferentDimensions),
        ("testAddScalarAssign", testAddScalarAssign),
        ("testAddScalarLeft", testAddScalarLeft),
        ("testAddScalarRight", testAddScalarRight),
        ("testDivideScalarAssign", testDivideScalarAssign),
        ("testDivideScalarLeft", testDivideScalarLeft),
        ("testDivideScalarRight", testDivideScalarRight),
        ("testEquals", testEquals),
        ("testEqualsDifferentDimensions", testEqualsDifferentDimensions),
        ("testInitEmpty", testInitEmpty),
        ("testInitExactlyEnoughElements", testInitExactlyEnoughElements),
        ("testInitToManyElements", testInitToManyElements),
        ("testInitTooFewElements", testInitTooFewElements),
        ("testMultiply", testMultiply),
        ("testMultiplyIncorrectDimensions", testMultiplyIncorrectDimensions),
        ("testMultiplyScalarAssign", testMultiplyScalarAssign),
        ("testMultiplyScalarLeft", testMultiplyScalarLeft),
        ("testMultiplyScalarRight", testMultiplyScalarRight),
        ("testSubscriptIndex", testSubscriptIndex),
        ("testSubscriptRowColumn", testSubscriptRowColumn),
        ("testSubtract", testSubtract),
        ("testSubtractDifferentDimensions", testSubtractDifferentDimensions),
        ("testSubtractScalarAssign", testSubtractScalarAssign),
        ("testSubtractScalarLeft", testSubtractScalarLeft),
        ("testSubtractScalarRight", testSubtractScalarRight),
        ("testTransposeColumnsGreaterThanRows", testTransposeColumnsGreaterThanRows),
        ("testTransposeRowsGreaterThanColumns", testTransposeRowsGreaterThanColumns),
    ]
}

extension Vector3Tests {
    static let __allTests = [
        ("testCross", testCross),
        ("testCrossRandomComponents", testCrossRandomComponents),
        ("testCrossReversed", testCrossReversed),
        ("testGetB", testGetB),
        ("testGetBlue", testGetBlue),
        ("testGetG", testGetG),
        ("testGetGreen", testGetGreen),
        ("testGetR", testGetR),
        ("testGetRed", testGetRed),
        ("testGetX", testGetX),
        ("testGetY", testGetY),
        ("testGetZ", testGetZ),
        ("testInit", testInit),
        ("testSetB", testSetB),
        ("testSetBlue", testSetBlue),
        ("testSetG", testSetG),
        ("testSetGreen", testSetGreen),
        ("testSetR", testSetR),
        ("testSetRed", testSetRed),
        ("testSetX", testSetX),
        ("testSetY", testSetY),
        ("testSetZ", testSetZ),
        ("testSubscriptGet", testSubscriptGet),
        ("testSubscriptSet", testSubscriptSet),
    ]
}

extension Vector4Tests {
    static let __allTests = [
        ("testGetA", testGetA),
        ("testGetAlpha", testGetAlpha),
        ("testGetB", testGetB),
        ("testGetBlue", testGetBlue),
        ("testGetG", testGetG),
        ("testGetGreen", testGetGreen),
        ("testGetR", testGetR),
        ("testGetRed", testGetRed),
        ("testGetW", testGetW),
        ("testGetX", testGetX),
        ("testGetY", testGetY),
        ("testGetZ", testGetZ),
        ("testInit", testInit),
        ("testSetA", testSetA),
        ("testSetAlpha", testSetAlpha),
        ("testSetB", testSetB),
        ("testSetBlue", testSetBlue),
        ("testSetG", testSetG),
        ("testSetGreen", testSetGreen),
        ("testSetR", testSetR),
        ("testSetRed", testSetRed),
        ("testSetW", testSetW),
        ("testSetX", testSetX),
        ("testSetY", testSetY),
        ("testSetZ", testSetZ),
        ("testSubscriptGet", testSubscriptGet),
        ("testSubscriptSet", testSubscriptSet),
    ]
}

extension VectorTests {
    static let __allTests = [
        ("testAdd", testAdd),
        ("testAddAssign", testAddAssign),
        ("testAddScalarAssign", testAddScalarAssign),
        ("testAddScalarLeft", testAddScalarLeft),
        ("testAddScalarRight", testAddScalarRight),
        ("testDivide", testDivide),
        ("testDivideAssign", testDivideAssign),
        ("testDivideScalarAssign", testDivideScalarAssign),
        ("testDivideScalarLeft", testDivideScalarLeft),
        ("testDivideScalarRight", testDivideScalarRight),
        ("testDot", testDot),
        ("testDotAllNegativeComponents", testDotAllNegativeComponents),
        ("testDotSomeNegativeComponents", testDotSomeNegativeComponents),
        ("testEquals", testEquals),
        ("testEqualsFalse", testEqualsFalse),
        ("testInitWithComponents", testInitWithComponents),
        ("testLength", testLength),
        ("testLengthNegativeComponents", testLengthNegativeComponents),
        ("testMultiply", testMultiply),
        ("testMultiplyAssign", testMultiplyAssign),
        ("testMultiplyScalarAssign", testMultiplyScalarAssign),
        ("testMultiplyScalarLeft", testMultiplyScalarLeft),
        ("testMultiplyScalarRight", testMultiplyScalarRight),
        ("testNegation", testNegation),
        ("testNegationNegativeComponents", testNegationNegativeComponents),
        ("testSubtract", testSubtract),
        ("testSubtractAssign", testSubtractAssign),
        ("testSubtractScalarAssign", testSubtractScalarAssign),
        ("testSubtractScalarLeft", testSubtractScalarLeft),
        ("testSubtractScalarRight", testSubtractScalarRight),
        ("testUnit", testUnit),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Matrix3Tests.__allTests),
        testCase(Matrix4Tests.__allTests),
        testCase(PointTests.__allTests),
        testCase(VariableSizeMatrixTests.__allTests),
        testCase(Vector3Tests.__allTests),
        testCase(Vector4Tests.__allTests),
        testCase(VectorTests.__allTests),
    ]
}
#endif
