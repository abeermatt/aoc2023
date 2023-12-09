//
//  Array+ExtensionTests.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 30/11/2023.
//

import XCTest

final class Array_ExtensionTests: XCTestCase {



    func testGroupByWithoutTransform() throws {
        let actual = [0,1,2,0,1].groupBy({ x in x == 0})
        XCTAssertEqual([[], [1,2], [1]], actual)
    }

    func testGroupByWithTransform() throws {
        let actual = [0,1,2,0,1].groupBy({ x in x == 0}, transform: { x in String(x) })
        XCTAssertEqual([[], ["1","2"], ["1"]], actual)
    }
    
    func testChunkEvery() throws {
        XCTAssertEqual([[1]], [1].chunk(every: 1))
        XCTAssertEqual([[1]], [1].chunk(every: 5))
        XCTAssertEqual([[1]], [1].chunk(every: 5))
        XCTAssertEqual([[1], [2], [3]], [1,2,3].chunk(every: 1))
        XCTAssertEqual([[1,2], [3, 4]], [1,2,3,4].chunk(every: 2))
    }
    
    func testStepDifferences() throws {
        XCTAssertEqual([3,3,3,3,3], [0, 3, 6, 9, 12, 15].stepDifferences())
        XCTAssertEqual([0,0,0,0], [3, 3, 3, 3, 3].stepDifferences())
        XCTAssertEqual([2,3,4,5,6], [1, 3, 6, 10, 15, 21].stepDifferences())
    }

}
