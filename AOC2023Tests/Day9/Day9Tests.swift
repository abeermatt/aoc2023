//
//  Day6Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 06/12/2023.
//

import XCTest

final class Day9Tests: XCTestCase {
        
    func testPart1Sample() throws {
        let input = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"""
        XCTAssertEqual(114, Day9.Part1.run(input))
    }

    func testPart1() throws {
        let input = try TestHelpers.readFile(named: "Day9")
        XCTAssertEqual(1969958987, Day9.Part1.run(input))
    }
    
    func testPart2Sample() throws {
        let input = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"""
        let actual = Day9.Part2.run(input)
        XCTAssertEqual(2, actual)
    }
    
    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day9")
        XCTAssertEqual(1068, Day9.Part2.run(input))
    }


}
