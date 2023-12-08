//
//  Day6Tests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 06/12/2023.
//

import XCTest

final class Day8Tests: XCTestCase {
    
    let sampleInput1 = """
RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)
"""
    
    let sampleInput2 = """
LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)
"""

    
    func testPart1Sample() throws {
        XCTAssertEqual(2, Day8.Part1.stepCount(sampleInput1))
        XCTAssertEqual(6, Day8.Part1.stepCount(sampleInput2))
    }

    func testPart1() throws {
        let input = try TestHelpers.readFile(named: "Day8")
        XCTAssertEqual(18673, Day8.Part1.stepCount(input))
    }
    
    func testPart2Sample() async throws {
        let input = """
LR

11A = (11B, XXX)
11B = (XXX, 11Z)
11Z = (11B, XXX)
22A = (22B, XXX)
22B = (22C, 22C)
22C = (22Z, 22Z)
22Z = (22B, 22B)
XXX = (XXX, XXX)
"""
        let actual = await Day8.Part2.stepCount(input)
        XCTAssertEqual(6, actual)
    }
    
    func testPart2() async throws {
        let input = try TestHelpers.readFile(named: "Day8")
        let actual = await Day8.Part2.stepCount(input)
        XCTAssertEqual(17972669116327, actual)
    }


}
