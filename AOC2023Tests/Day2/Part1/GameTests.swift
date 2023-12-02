//
//  GameTests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 02/12/2023.
//

import XCTest

final class GameTests: XCTestCase {


    func testFromLine() throws {
        let input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
        let game = Day2.Part1.Game.fromLine(input)
        XCTAssertEqual(1, game.id)
        XCTAssertEqual(3, game.records.count)
        XCTAssertTrue(game.records.contains(Day2.Part1.Record(red: 4, blue: 3, green: 0)))
        XCTAssertTrue(game.records.contains(Day2.Part1.Record(red: 1, blue: 6, green: 2)))
        XCTAssertTrue(game.records.contains(Day2.Part1.Record(red: 0, blue: 0, green: 2)))

    }
    
    func testFromLine2() throws {
        let input = "Game 1: 3 blue, 4 red"
        let game = Day2.Part1.Game.fromLine(input)
        XCTAssertEqual(1, game.id)
        XCTAssertEqual(1, game.records.count)
        XCTAssertTrue(game.records.contains(Day2.Part1.Record(red: 4, blue: 3, green: 0)))
        
    }
    
    func testFromLine3() throws {
        let input = "Game 1: 3 blue"
        let game = Day2.Part1.Game.fromLine(input)
        XCTAssertEqual(1, game.id)
        XCTAssertEqual(1, game.records.count)
        XCTAssertTrue(game.records.contains(Day2.Part1.Record(red: 0, blue: 3, green: 0)))
        
    }




}
