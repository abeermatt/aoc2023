//
//  Day4Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 04/12/2023.
//

import XCTest

final class Day4Tests: XCTestCase {
    
    let sampleInput = """
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11
"""

    func testPart1Sample() throws {
        XCTAssertEqual(13, Day4.Part1.worth(sampleInput))
    }

    func testPart1() throws {
        let input = try TestHelpers.readFile(named: "Day4")
        XCTAssertEqual(21959, Day4.Part1.worth(input))
    }

    func testPart2Sample() throws {
        XCTAssertEqual(30, Day4.Part2.numberOfScratchcards(sampleInput))
    }
    
    func testPart2() throws {
        let input = try TestHelpers.readFile(named: "Day4")

        XCTAssertEqual(5132675, Day4.Part2.numberOfScratchcards(input))
    }


}
