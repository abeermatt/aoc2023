//
//  MMapTests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 05/12/2023.
//

import XCTest

final class MMapTests: XCTestCase {

    func testGetDestination() throws {
        let input = """
50 98 2
52 50 48
"""
        let map = Day5.MMap.fromInput(input)
        XCTAssertEqual(81, map.getDestination(forSource: 79))
        XCTAssertEqual(14, map.getDestination(forSource: 14))
        XCTAssertEqual(57, map.getDestination(forSource: 55))
        XCTAssertEqual(13, map.getDestination(forSource: 13))
    }

}
