import XCTest

final class OasisTests: XCTestCase {

    func testSumsNextValues() throws {
        let input = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"""
        let oasis = Day9.Oasis.parse(input)
        XCTAssertEqual(114, oasis.sumOfNextValues())
    }

    func testSumsPreviousValues() throws {
        let input = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"""
        let oasis = Day9.Oasis.parse(input)
        XCTAssertEqual(2, oasis.sumOfPreviousValues())
    }

}
