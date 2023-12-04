import XCTest

final class PartNumberTests: XCTestCase {

    func testTouching() throws {
        let number = Day3.PartNumber(x: 1, y: 1, value: 1)
        XCTAssertTrue(number.touching(symbol: Day3.Symbol(x: 0, y: 0, value: "*")))
        XCTAssertTrue(number.touching(symbol: Day3.Symbol(x: 1, y: 0, value: "*")))
        XCTAssertTrue(number.touching(symbol: Day3.Symbol(x: 2, y: 0, value: "*")))
        XCTAssertFalse(number.touching(symbol: Day3.Symbol(x: 3, y: 0, value: "*")))
        XCTAssertTrue(number.touching(symbol: Day3.Symbol(x: 0, y: 1, value: "*")))
        XCTAssertTrue(number.touching(symbol: Day3.Symbol(x: 2, y: 1, value: "*")))
        XCTAssertFalse(number.touching(symbol: Day3.Symbol(x: 3, y: 1, value: "*")))
        XCTAssertFalse(number.touching(symbol: Day3.Symbol(x: 4, y: 1, value: "*")))
        XCTAssertTrue(number.touching(symbol: Day3.Symbol(x: 0, y: 2, value: "*")))
        XCTAssertTrue(number.touching(symbol: Day3.Symbol(x: 1, y: 2, value: "*")))
        XCTAssertTrue(number.touching(symbol: Day3.Symbol(x: 2, y: 2, value: "*")))
        XCTAssertFalse(number.touching(symbol: Day3.Symbol(x: 3, y: 2, value: "*")))
        XCTAssertFalse(number.touching(symbol: Day3.Symbol(x: 4, y: 2, value: "*")))
        XCTAssertFalse(number.touching(symbol: Day3.Symbol(x: 0, y: 3, value: "*")))
    }
    
//"""
//....
//.1..
//....
//"""


}
