import XCTest

final class HistoryTests: XCTestCase {

    func testNextValue() throws {
        XCTAssertEqual(18, Day9.History(values: [0, 3, 6, 9, 12, 15]).nextValue())
        XCTAssertEqual(68, Day9.History(values: [10, 13, 16, 21, 30, 45]).nextValue())
    }

    func testPreviousValue() throws {
        XCTAssertEqual(-3, Day9.History(values: [0, 3, 6, 9, 12, 15]).previousValue())
        XCTAssertEqual(5, Day9.History(values: [10, 13, 16, 21, 30, 45]).previousValue())
        XCTAssertEqual(0, Day9.History(values: [1,3,6,10,15,21]).previousValue())
    }

}
