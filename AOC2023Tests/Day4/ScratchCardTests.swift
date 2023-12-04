import XCTest

final class ScratchCardTests: XCTestCase {

    func testParsing() throws {
        let card1 = Day4.ScratchCard.fromInput("41 48 83 86 17")
        XCTAssertTrue(card1.numbers == Set([41, 48, 83, 86, 17]))

        let card2 = Day4.ScratchCard.fromInput("41  8 83 86 17")
        XCTAssertTrue(card2.numbers == Set([41, 8, 83, 86, 17]))
    }
    
    func testMatches() throws {
        let card1 = Day4.ScratchCard.fromInput("41 48 83 86 17")
        XCTAssertEqual(Set([48, 83, 17, 86]), card1.matches(in: "83 86  6 31 17  9 48 53"))

        let card2 = Day4.ScratchCard.fromInput("13 32 20 16 61")
        XCTAssertEqual(Set([32, 61]), card2.matches(in: "61 30 68 82 17 32 24 19"))

        let card3 = Day4.ScratchCard.fromInput(" 1 21 53 59 44")
        XCTAssertEqual(Set([1, 21]), card3.matches(in: "69 82 63 72 16 21 14  1"))

        let card4 = Day4.ScratchCard.fromInput("41 92 73 84 69")
        XCTAssertEqual(Set([84]), card4.matches(in: "59 84 76 51 58  5 54 83"))

        let card5 = Day4.ScratchCard.fromInput("87 83 26 28 32")
       XCTAssertTrue(card5.matches(in: "88 30 70 12 93 22 82 36").isEmpty)

        let card6 = Day4.ScratchCard.fromInput("31 18 13 56 72")
       XCTAssertTrue(card6.matches(in: "74 77 10 23 35 67 36 11").isEmpty)

    }

}
