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
        XCTAssertEqual(["O....#....", "O.OO#....#"], platform.levels)
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
        var platform = Day14.Platform.parse(input)
        platform.tiltNorth()
        
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
        XCTAssertEqual(expected, platform.description)
    }
    
    func testTiltWest() throws {
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
        var platform = Day14.Platform.parse(input)
        platform.tiltWest()
        
        let expected = """
O....#....
OOO.#....#
.....##...
OO.#OO....
OO......#.
O.#O...#.#
O....#OO..
O.........
#....###..
#OO..#....
"""
        XCTAssertEqual(expected, platform.description)
    }

    func testTiltSouth() throws {
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
        var platform = Day14.Platform.parse(input)
        platform.tiltSouth()
        
        let expected = """
.....#....
....#....#
...O.##...
...#......
O.O....O#O
O.#..O.#.#
O....#....
OO....OO..
#OO..###..
#OO.O#...O
"""
        XCTAssertEqual(expected, platform.description)
    }

    func testTiltEast() throws {
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
        var platform = Day14.Platform.parse(input)
        platform.tiltEast()
        
        let expected = """
....O#....
.OOO#....#
.....##...
.OO#....OO
......OO#.
.O#...O#.#
....O#..OO
.........O
#....###..
#..OO#....
"""
        XCTAssertEqual(expected, platform.description)
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

    func testCycle() throws {
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
        var platform = Day14.Platform.parse(input)
        platform.cycle(1)

        let after1Cycle = """
.....#....
....#...O#
...OO##...
.OO#......
.....OOO#.
.O#...O#.#
....O#....
......OOOO
#...O###..
#..OO#....
"""
        XCTAssertEqual(after1Cycle, platform.description)
        
        platform = Day14.Platform.parse(input)
        platform.cycle(2)
        let after2Cycles = """
.....#....
....#...O#
.....##...
..O#......
.....OOO#.
.O#...O#.#
....O#...O
.......OOO
#..OO###..
#.OOO#...O
"""
        XCTAssertEqual(after2Cycles, platform.description)

        platform = Day14.Platform.parse(input)
        platform.cycle(3)
        let after3Cycles = """
.....#....
....#...O#
.....##...
..O#......
.....OOO#.
.O#...O#.#
....O#...O
.......OOO
#...O###.O
#.OOO#...O
"""
        XCTAssertEqual(after3Cycles, platform.description)

    }
    
//    func testCompleteCycle() throws {
//        let input = """
//O....#....
//O.OO#....#
//.....##...
//OO.#O....O
//.O.....O#.
//O.#..O.#.#
//..O..#O..O
//.......O..
//#....###..
//#OO..#....
//"""
//        let platform = Day14.Platform.parse(input)
//        let cycled = platform.cycle(1)
//        XCTAssertEqual(platform, cycled)
//    }

}
