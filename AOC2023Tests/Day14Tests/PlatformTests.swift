import XCTest

final class PlatformTests: XCTestCase {
    
    func testColumns() throws {
        let input = """
O....#....
O.OO#....#
"""
        let expected = ["OO", "..", ".O", ".O", ".#", "#.", "..", "..", "..", ".#"]

        let platform = Day14.Platform.parse(input)
        
        XCTAssertEqual(expected, platform.columns)
        XCTAssertEqual(["O....#....", "O.OO#....#"], platform.levels())
    }

    func testDescription() throws {
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
        let platform = Day14.Platform.parse(input)
        XCTAssertEqual(input, platform.description)
    }

    func testTiltNorth() throws {
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
        let platform = Day14.Platform.parse(input)
        let tilted = platform.tiltNorth()
        
        let expected = """
OOOO.#.O..
OO..#....#
OO..O##..O
O..#.OO...
........#.
..#....#.#
..O..#.O.O
..O.......
#....###..
#....#....
"""
        XCTAssertEqual(expected, tilted.description)
    }
    
    func testRocksAtLevel() throws {
        let input = """
OOOO.#.O..
OO..#....#
OO..O##..O
O..#.OO...
........#.
..#....#.#
..O..#.O.O
..O.......
#....###..
#....#....
"""
        let platform = Day14.Platform.parse(input)
        XCTAssertEqual(5, platform.roundRocks(atLevel: 10))
        XCTAssertEqual(2, platform.roundRocks(atLevel: 9))
        XCTAssertEqual(4, platform.roundRocks(atLevel: 8))
        XCTAssertEqual(3, platform.roundRocks(atLevel: 7))
        XCTAssertEqual(0, platform.roundRocks(atLevel: 6))
        XCTAssertEqual(0, platform.roundRocks(atLevel: 5))
        XCTAssertEqual(3, platform.roundRocks(atLevel: 4))
        XCTAssertEqual(1, platform.roundRocks(atLevel: 3))
        XCTAssertEqual(0, platform.roundRocks(atLevel: 2))
        XCTAssertEqual(0, platform.roundRocks(atLevel: 1))

    }
    
    func testLoadAtLevel() throws {
        let input = """
OOOO.#.O..
OO..#....#
OO..O##..O
O..#.OO...
........#.
..#....#.#
..O..#.O.O
..O.......
#....###..
#....#....
"""
        let platform = Day14.Platform.parse(input)
        XCTAssertEqual(50, platform.loadOfRoundRocks(atLevel: 10))
        XCTAssertEqual(18, platform.loadOfRoundRocks(atLevel: 9))
        XCTAssertEqual(32, platform.loadOfRoundRocks(atLevel: 8))
        XCTAssertEqual(21, platform.loadOfRoundRocks(atLevel: 7))
        XCTAssertEqual(0, platform.loadOfRoundRocks(atLevel: 6))
        XCTAssertEqual(0, platform.loadOfRoundRocks(atLevel: 5))
        XCTAssertEqual(12, platform.loadOfRoundRocks(atLevel: 4))
        XCTAssertEqual(3, platform.loadOfRoundRocks(atLevel: 3))
        XCTAssertEqual(0, platform.loadOfRoundRocks(atLevel: 2))
        XCTAssertEqual(0, platform.loadOfRoundRocks(atLevel: 1))
    }


}
