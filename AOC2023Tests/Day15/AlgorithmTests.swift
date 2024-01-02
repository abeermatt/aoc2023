import XCTest

final class AlgorithmTests: XCTestCase {
    
    func testHash() throws {
        XCTAssertEqual(Day15.Algorithm.hash("HASH"), 52)
    }

    func testHashExamples() throws {
        XCTAssertEqual(Day15.Algorithm.hash("rn=1"), 30)
        XCTAssertEqual(Day15.Algorithm.hash("cm-"), 253)
        XCTAssertEqual(Day15.Algorithm.hash("qp=3"), 97)
        XCTAssertEqual(Day15.Algorithm.hash("cm=2"), 47)
        XCTAssertEqual(Day15.Algorithm.hash("qp-"), 14)
        XCTAssertEqual(Day15.Algorithm.hash("pc=4"), 180)
        XCTAssertEqual(Day15.Algorithm.hash("ot=9"), 9)
        XCTAssertEqual(Day15.Algorithm.hash("ab=5"), 197)
        XCTAssertEqual(Day15.Algorithm.hash("pc-"), 48)
        XCTAssertEqual(Day15.Algorithm.hash("pc=6"), 214)
        XCTAssertEqual(Day15.Algorithm.hash("ot=7"), 231)
    }


}
