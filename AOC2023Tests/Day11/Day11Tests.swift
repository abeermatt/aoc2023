//
//  Day6Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 06/12/2023.
//

import XCTest

final class Day11Tests: XCTestCase {
        
    func testPart1Sample1() throws {
        let input = """
...#......
.......#..
#.........
..........
......#...
.#........
.........#
..........
.......#..
#...#.....
"""
        XCTAssertEqual(374, Day11.Part1.run(input))
    }

    func testPart1() throws {
        let input = try TestHelpers.readFile(named: "Day11")
        XCTAssertEqual(9965032, Day11.Part1.run(input))
    }
    
    func testPart2Sample1() throws {
        let input = """
...........
.S-------7.
.|F-----7|.
.||.....||.
.||.....||.
.|L-7.F-J|.
.|..|.|..|.
.L--J.L--J.
...........
"""
        let actual = Day11.Part2.run(input)
        XCTAssertEqual(4, actual)
    }
    
    func testPart2Sample2() throws {
        let input = """
.F----7F7F7F7F-7....
.|F--7||||||||FJ....
.||.FJ||||||||L7....
FJL7L7LJLJ||LJ.L-7..
L--J.L7...LJS7F-7L7.
....F-J..F7FJ|L7L7L7
....L7.F7||L7|.L7L7|
.....|FJLJ|FJ|F7|.LJ
....FJL-7.||.||||...
....L---J.LJ.LJLJ...
"""
        let actual = Day11.Part2.run(input)
        XCTAssertEqual(8, actual)
    }

    
    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day11")
        XCTAssertEqual(287, Day11.Part2.run(input))
    }


}
