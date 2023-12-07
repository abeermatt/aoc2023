//
//  Day6Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 06/12/2023.
//

import XCTest

final class Day7Tests: XCTestCase {
    
    let sampleInput = """
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
"""
    
    func testTotalWinnings() throws {
        XCTAssertEqual(6440, Day7.Part1.totalWinnings(sampleInput))
    }



    func testPart1() throws {
        let input = try TestHelpers.readFile(named: "Day7")

        XCTAssertEqual(249390788, Day7.Part1.totalWinnings(input))
    }

    
}
