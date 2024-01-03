import XCTest

final class OperationTests: XCTestCase {


    func testParse() throws {
        XCTAssertEqual(Day15.Operation.parse("rn=1"), .equals("rn", 1))
        XCTAssertEqual(Day15.Operation.parse("qp=3"), .equals("qp", 3))
        XCTAssertEqual(Day15.Operation.parse("cm-"), .dash("cm"))
    }
    
    func testLens() throws {
        XCTAssertEqual(Day15.Operation.parse("rn=1").lens, "rn")
        XCTAssertEqual(Day15.Operation.parse("cm-").lens, "cm")
    }


}
