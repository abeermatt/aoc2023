import XCTest

class Day13Tests: XCTestCase {
        
    func testPart1Sample1() async throws {
        let input = """
???.### 1,1,3
.??..??...?##. 1,1,3
?#?#?#?#?#?#?#? 1,3,1,6
????.#...#... 4,1,1
????.######..#####. 1,6,5
?###???????? 3,2,1
"""
        let sum = await Day13.Part1.run(input)
        XCTAssertEqual(21, sum)
    }

    // slooooowww
    func xtestPart1() async throws {
        let input = try TestHelpers.readFile(named: "Day13")
        let sum = await Day13.Part1.run(input)
        XCTAssertEqual(7344, sum)
    }
        
    
    func testPart2Sample() throws {
        let input = try TestHelpers.readFile(named: "Day13")
        XCTAssertEqual(525152, Day13.Part2.run(input))
    }

    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day13")
        XCTAssertEqual(550358864332, Day13.Part2.run(input))
    }


}
