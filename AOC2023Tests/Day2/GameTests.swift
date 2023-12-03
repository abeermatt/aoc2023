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
        let game = Day2.Game.fromLine(input)
        XCTAssertEqual(1, game.id)
        XCTAssertEqual(3, game.records.count)
        XCTAssertTrue(game.records.contains(Day2.Record(red: 4, blue: 3, green: 0)))
        XCTAssertTrue(game.records.contains(Day2.Record(red: 1, blue: 6, green: 2)))
        XCTAssertTrue(game.records.contains(Day2.Record(red: 0, blue: 0, green: 2)))

    }
    
    func testFromLine2() throws {
        let input = "Game 1: 3 blue, 4 red"
        let game = Day2.Game.fromLine(input)
        XCTAssertEqual(1, game.id)
        XCTAssertEqual(1, game.records.count)
        XCTAssertTrue(game.records.contains(Day2.Record(red: 4, blue: 3, green: 0)))
        
    }
    
    func testFromLine3() throws {
        let input = "Game 1: 3 blue"
        let game = Day2.Game.fromLine(input)
        XCTAssertEqual(1, game.id)
        XCTAssertEqual(1, game.records.count)
        XCTAssertTrue(game.records.contains(Day2.Record(red: 0, blue: 3, green: 0)))
        
    }

    func testFewestNumber() throws {
        let game1 = Day2.Game.fromLine("Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green")
        XCTAssertEqual(Day2.Record(red: 4, blue: 6, green: 2), game1.fewestNumber)

        let game2 = Day2.Game.fromLine("Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue")
        XCTAssertEqual(Day2.Record(red: 1, blue: 4, green: 3), game2.fewestNumber)

        let game3 = Day2.Game.fromLine("Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red")
        XCTAssertEqual(Day2.Record(red: 20, blue: 6, green: 13), game3.fewestNumber)

        let game4 = Day2.Game.fromLine("Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red")
        XCTAssertEqual(Day2.Record(red: 14, blue: 15, green: 3), game4.fewestNumber)

        let game5 = Day2.Game.fromLine("Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green")
        XCTAssertEqual(Day2.Record(red: 6, blue: 2, green: 3), game5.fewestNumber)

    }



}
