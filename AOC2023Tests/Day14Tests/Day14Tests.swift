import XCTest

class Day14Tests: XCTestCase {
        
    func testPart1Sample1() throws {
        let input = """
O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#....
"""
        let sum = Day14.Part1.run(input)
        XCTAssertEqual(136, sum)
    }

    func testPart1() async throws {
        let input = try TestHelpers.readFile(named: "Day14")
        let sum = Day14.Part1.run(input)
        XCTAssertEqual(109661, sum)
    }
        
    func testPart2Sample() throws {
        let input = """
O....#....
O.OO#....#
.....##...
OO.#O....O
.O.....O#.
O.#..O.#.#
..O..#O..O
.......O..
#....###..
#OO..#....
"""
        let load = Day14.Part2.run(input)
        XCTAssertEqual(64, load)
    }

    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day14")
        XCTAssertEqual(99194, Day14.Part2.run(input))
    }


}
