import XCTest
@testable import DJWCommon

final class DJWCommonTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(DJWCommon().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
