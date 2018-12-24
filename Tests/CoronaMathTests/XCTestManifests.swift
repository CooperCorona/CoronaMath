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
        testCase(VectorTests.__allTests),
    ]
}
#endif
