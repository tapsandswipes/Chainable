import XCTest
@testable import Chainable

final class ChainableTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Chainable().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
