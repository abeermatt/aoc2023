//
//  Day6Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 06/12/2023.
//

import XCTest

final class Day6Tests: XCTestCase {
    
    let sampleInput = """
Time:      7  15   30
Distance:  9  40  200
"""

    func testMaxDistance() throws {
        XCTAssertEqual(0, Day6.Part1.maximumDistance(forRaceLasting: 7, withButtonDownTimeOf: 0))
        XCTAssertEqual(6, Day6.Part1.maximumDistance(forRaceLasting: 7, withButtonDownTimeOf: 1))
        XCTAssertEqual(10, Day6.Part1.maximumDistance(forRaceLasting: 7, withButtonDownTimeOf: 2))
        XCTAssertEqual(12, Day6.Part1.maximumDistance(forRaceLasting: 7, withButtonDownTimeOf: 3))
        XCTAssertEqual(12, Day6.Part1.maximumDistance(forRaceLasting: 7, withButtonDownTimeOf: 4))
        XCTAssertEqual(10, Day6.Part1.maximumDistance(forRaceLasting: 7, withButtonDownTimeOf: 5))
        XCTAssertEqual(6, Day6.Part1.maximumDistance(forRaceLasting: 7, withButtonDownTimeOf: 6))
        XCTAssertEqual(0, Day6.Part1.maximumDistance(forRaceLasting: 7, withButtonDownTimeOf: 7))
    }
    
    func testWaysToWin() throws {
        XCTAssertEqual(4, Day6.Part1.waysOfBeating(raceRecord: 9, forRaceLasting: 7))
        XCTAssertEqual(8, Day6.Part1.waysOfBeating(raceRecord: 40, forRaceLasting: 15))
        XCTAssertEqual(9, Day6.Part1.waysOfBeating(raceRecord: 200, forRaceLasting: 30))
    }
    
    func testMarginOfError() throws {
        XCTAssertEqual(288, Day6.Part1.marginOfError(forInput: sampleInput))
    }
    
    func testPart1() throws {
        let input = try TestHelpers.readFile(named: "Day6")

        XCTAssertEqual(1155175, Day6.Part1.marginOfError(forInput: input))

    }


}
