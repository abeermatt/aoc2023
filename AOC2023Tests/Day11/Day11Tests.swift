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
    

    
    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day11")
        XCTAssertEqual(550358864332, Day11.Part2.run(input))
    }


}
