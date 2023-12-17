import XCTest

class Day13Tests: XCTestCase {
        
    func testPart1Sample1() throws {
        let input = """
#.##..##.
..#.##.#.
##......#
##......#
..#.##.#.
..##..##.
#.#.##.#.

#...##..#
#....#..#
..##..###
#####.##.
#####.##.
..##..###
#....#..#
"""
        let sum = Day13.Part1.run(input)
        XCTAssertEqual(405, sum)
    }

    func testPart1() async throws {
        let input = try TestHelpers.readFile(named: "Day13")
        let sum = Day13.Part1.run(input)
        XCTAssertEqual(37025, sum)
    }
        
    
//    func testPart2Sample() throws {
//        let input = try TestHelpers.readFile(named: "Day13")
//        XCTAssertEqual(525152, Day13.Part2.run(input))
//    }
//
//    func testPart2() throws {
//        let input = try TestHelpers.readFile(named: "Day13")
//        XCTAssertEqual(550358864332, Day13.Part2.run(input))
//    }


}
