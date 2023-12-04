//
//  Day3Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 03/12/2023.
//

import XCTest

final class Day3Tests: XCTestCase {
    
    let sampleInput = """
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
"""
    

    func testPart1Sample() throws {
        XCTAssertEqual(4361, Day3.Part1.sum(sampleInput))
    }

    func testPart1() throws {
        let input = try TestHelpers.readFile(named: "Day3")
        XCTAssertEqual(531932, Day3.Part1.sum(input))
    }

}
