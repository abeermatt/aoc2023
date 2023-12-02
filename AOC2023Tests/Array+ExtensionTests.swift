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

}
