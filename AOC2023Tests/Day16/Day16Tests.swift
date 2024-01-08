import XCTest

class Day16Tests: XCTestCase {
        
    func testPart1Sample1() throws {
        let input = #"""
.|...\....
|.-.\.....
.....|-...
........|.
..........
.........\
..../.\\..
.-.-/..|..
.|....-|.\
..//.|....
"""#
        let sum = Day16.Part1.run(input)
        XCTAssertEqual(46, sum)
    }

    func testPart1() async throws {
        let input = try TestHelpers.readFile(named: "Day16")
        let sum = Day16.Part1.run(input)
        XCTAssertEqual(7951, sum)
    }
        
    func testPart2Sample() throws {
        let input = #"""
.|...\....
|.-.\.....
.....|-...
........|.
..........
.........\
..../.\\..
.-.-/..|..
.|....-|.\
..//.|....
"""#
        let sum = Day16.Part2.run(input)
        XCTAssertEqual(51, sum)
    }

    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day16")
        let sum = Day16.Part2.run(input)
        XCTAssertEqual(8148, sum)
    }


}
