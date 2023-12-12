//
//  LandscapeTests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 11/12/2023.
//

import XCTest

final class LandscapeTests: XCTestCase {

    func testWalk() throws {
        let input = """
-L|F7
7S-7|
L|7||
-L-J|
L|-JF
"""
        let landscape = Day10.Landscape.parse(input)
        let tiles = landscape.walk()
        let pipes = tiles.map(\.pipe)
        
        let expected: [Day10.Pipe] = [.start, .northSouth, .northEast, .eastWest, .northWest, .northSouth, .southWest, .eastWest]
        
        XCTAssertEqual(expected, pipes)
    }


}
