//
//  RecordTests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 02/12/2023.
//

import XCTest

final class RecordTests: XCTestCase {

    func testIsPossible() throws {
        XCTAssertTrue(Day2.Part1.Record(red: 0, blue: 0, green: 0).isPossible(red: 0, blue: 0, green: 0))
        XCTAssertTrue(Day2.Part1.Record(red: 0, blue: 0, green: 0).isPossible(red: 1, blue: 1, green: 1))
        XCTAssertFalse(Day2.Part1.Record(red: 1, blue: 0, green: 0).isPossible(red: 0, blue: 5, green: 5))
        XCTAssertFalse(Day2.Part1.Record(red: 1, blue: 2, green: 5).isPossible(red: 5, blue: 5, green: 4))
        XCTAssertTrue(Day2.Part1.Record(red: 1, blue: 1, green: 0).isPossible(red: 2, blue: 2, green: 1))
    }
    
    func testFromSet() throws {
        XCTAssertEqual(Day2.Part1.Record.fromSet("3 blue"), Day2.Part1.Record(red: 0, blue: 3, green: 0))
        XCTAssertEqual(Day2.Part1.Record.fromSet("3 blue, 4 red"), Day2.Part1.Record(red: 4, blue: 3, green: 0))
        XCTAssertEqual(Day2.Part1.Record.fromSet("3 blue, 4 red, 1 green"), Day2.Part1.Record(red: 4, blue: 3, green: 1))
    }
    
    func testPower() throws {
        XCTAssertEqual(Day2.Part1.Record(red: 4, blue: 6, green: 2).power, 48)
        XCTAssertEqual(Day2.Part1.Record(red: 1, blue: 4, green: 3).power, 12)
        XCTAssertEqual(Day2.Part1.Record(red: 20, blue: 6, green: 13).power, 1560)
        XCTAssertEqual(Day2.Part1.Record(red: 14, blue: 15, green: 3).power, 630)
        XCTAssertEqual(Day2.Part1.Record(red: 6, blue: 2, green: 3).power, 36)

    }
    

}
