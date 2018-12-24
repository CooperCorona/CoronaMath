import XCTest

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
        testCase(PointTests.__allTests),
        testCase(Vector3Tests.__allTests),
        testCase(Vector4Tests.__allTests),
        testCase(VectorTests.__allTests),
    ]
}
#endif
