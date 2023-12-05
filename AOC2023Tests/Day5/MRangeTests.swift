import XCTest

final class RangeTests: XCTestCase {

    func testRange() throws {
        let input = "50 98 2"
        let range = Day5.MRange.fromInput(input)
        
        XCTAssertFalse(range.sourceRange.contains(97))
        XCTAssertTrue(range.sourceRange.contains(98))
        XCTAssertTrue(range.sourceRange.contains(99))
        XCTAssertFalse(range.sourceRange.contains(100))
        
        XCTAssertFalse(range.destinationRange.contains(49))
        XCTAssertTrue(range.destinationRange.contains(50))
        XCTAssertTrue(range.destinationRange.contains(51))
        XCTAssertFalse(range.destinationRange.contains(52))
    }


}
