//
//  String+Extensions.swift
//  AOC2023Tests
//
//  Created by Matthew Hobbs on 02/12/2023.
//

import XCTest

final class String_ExtensionsTests: XCTestCase {


    func testTakePrefix() throws {
        XCTAssertEqual("", "".takePrefix(""))
        XCTAssertEqual("", "".takePrefix("1"))
        XCTAssertEqual("", "1".takePrefix("1"))
        XCTAssertEqual("2", "12".takePrefix("1"))
        XCTAssertEqual("12", "12".takePrefix("2"))
        XCTAssertEqual("two", "onetwo".takePrefix("one"))

    }

    func testTakeSuffix() throws {
        XCTAssertEqual("", "".takeSuffix(""))
        XCTAssertEqual("", "".takeSuffix("1"))
        XCTAssertEqual("", "1".takeSuffix("1"))
        XCTAssertEqual("1", "12".takeSuffix("2"))
        XCTAssertEqual("12", "12".takeSuffix("1"))
        XCTAssertEqual("one", "onetwo".takeSuffix("two"))

    }


}
