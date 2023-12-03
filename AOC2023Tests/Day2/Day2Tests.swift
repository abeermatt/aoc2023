//
//  Day2Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 02/12/2023.
//

import XCTest

final class Day2Tests: XCTestCase {
    
    let sampleInput = """
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"""

    func testPart1Example() throws {
        XCTAssertEqual(8, Day2.Part1.run(input: sampleInput, red: 12, green: 13, blue: 14))
    }
    
    func testPart1Full() throws {
        let input = try TestHelpers.readFile(named: "Day2Input")
        XCTAssertEqual(2505, Day2.Part1.run(input: input, red: 12, green: 13, blue: 14))
    }
    
    func testPart2Example() throws {
        XCTAssertEqual(2286, Day2.Part2.sum(input: sampleInput))
    }
    
    func testPart2Full() throws {
        let input = try TestHelpers.readFile(named: "Day2Input")
        XCTAssertEqual(70265, Day2.Part2.sum(input: input))
    }


}
