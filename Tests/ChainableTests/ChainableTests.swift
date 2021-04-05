import XCTest
@testable import Chainable

final class ChainableTests: XCTestCase {

    struct ValueObj: Chainable {
        var a: String
        var b: Int
    }
    
    class ClassObj: Chainable {
        var a: String
        var b: Int
        
        init(a: String, b: Int) {
            self.a = a
            self.b = b
        }
    }

    func testValueChain() {
        let sut = ValueObj(a: "Hello", b: 0)
        
        let b = sut.then {
            $0.a = "Goodbye"
        }
        
        XCTAssertEqual(sut.a, "Hello")
        XCTAssertEqual(sut.b, 0)
        XCTAssertEqual(b.a, "Goodbye")
        XCTAssertEqual(b.b, 0)
    }

    func testReferenceChain() {
        let sut = ClassObj(a: "Hello", b: 0)

        let b = sut.then {
            $0.a = "Goodbye"
        }

        XCTAssert(sut === b)
        XCTAssertEqual(sut.a, "Goodbye")
        XCTAssertEqual(sut.b, 0)
    }
    
    func testValueDo() {
        let sut = ValueObj(a: "Hello", b: 0)

        sut.do {
            XCTAssertEqual($0.a, "Hello")
            XCTAssertEqual($0.b, 0)
        }
        
        XCTAssertEqual(sut.a, "Hello")
        XCTAssertEqual(sut.b, 0)
    }
    
    func testReferenceDo() {
        let sut = ClassObj(a: "Hello", b: 0)
        
        sut.do {
            XCTAssertEqual($0.a, "Hello")
            XCTAssertEqual($0.b, 0)
        }
        
        XCTAssertEqual(sut.a, "Hello")
        XCTAssertEqual(sut.b, 0)
    }

    
    static var allTests = [
        ("testValueChain", testValueChain),
    ]
}

