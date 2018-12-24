import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(PointTests.allTests),
        testCase(VectorTests.allTests),
    ]
}
#endif
