import XCTest

final class RowTests: XCTestCase {
    

    func testArrangements() throws {
        XCTAssertEqual(1, Day12.Row.parse("???.### 1,1,3").arrangements())
        XCTAssertEqual(4, Day12.Row.parse(".??..??...?##. 1,1,3").arrangements())
        XCTAssertEqual(1, Day12.Row.parse("?#?#?#?#?#?#?#? 1,3,1,6").arrangements())
        XCTAssertEqual(1, Day12.Row.parse("????.#...#... 4,1,1").arrangements())
        XCTAssertEqual(4, Day12.Row.parse("????.######..#####. 1,6,5").arrangements())
        XCTAssertEqual(10, Day12.Row.parse("?###???????? 3,2,1").arrangements())
    }
    
    func testUnfoldedArrangements() throws {
        XCTAssertEqual(1, Day12.Row.parse("???.### 1,1,3").unfolded().arrangements())
        XCTAssertEqual(16384, Day12.Row.parse(".??..??...?##. 1,1,3").unfolded().arrangements())
        XCTAssertEqual(1, Day12.Row.parse("?#?#?#?#?#?#?#? 1,3,1,6").unfolded().arrangements())
        XCTAssertEqual(16, Day12.Row.parse("????.#...#... 4,1,1").unfolded().arrangements())
        XCTAssertEqual(2500, Day12.Row.parse("????.######..#####. 1,6,5").unfolded().arrangements())
        XCTAssertEqual(506250, Day12.Row.parse("?###???????? 3,2,1").unfolded().arrangements())

    }
    

}
