import XCTest

final class RowTests: XCTestCase {
    

    func testArrangements() throws {
        XCTAssertEqual(1, Day12.Row.parse("???.### 1,1,3").arrangements())
        XCTAssertEqual(4, Day12.Row.parse(".??..??...?##. 1,1,3").arrangements())
        XCTAssertEqual(1, Day12.Row.parse("?#?#?#?#?#?#?#? 1,3,1,6").arrangements())
        XCTAssertEqual(1, Day12.Row.parse("????.#...#... 4,1,1").arrangements())
        XCTAssertEqual(4, Day12.Row.parse("????.######..#####. 1,6,5").arrangements())
//        XCTAssertEqual(56, Day12.Row.parse("?????????????????# 1,3,1,2,2,1").arrangements())
    }
    

}
