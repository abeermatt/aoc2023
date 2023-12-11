//
//  Day6Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 06/12/2023.
//

import XCTest

final class Day10Tests: XCTestCase {
        
    func testPart1Sample1() throws {
        let input = """
-L|F7
7S-7|
L|7||
-L-J|
L|-JF
"""
        XCTAssertEqual(4, Day10.Part1.run(input))
    }
    
    func testPart1Sample2() throws {
        let input = """
7-F7-
.FJ|7
SJLL7
|F--J
LJ.LJ
"""
        XCTAssertEqual(8, Day10.Part1.run(input))
    }


    func testPart1() throws {
        let input = try TestHelpers.readFile(named: "Day10")
        XCTAssertEqual(6870, Day10.Part1.run(input))
    }
    
    func testPart2Sample() throws {
        let input = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"""
        let actual = Day10.Part2.run(input)
        XCTAssertEqual(2, actual)
    }
    
    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day10")
        XCTAssertEqual(1068, Day10.Part2.run(input))
    }


}
