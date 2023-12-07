import XCTest

final class HandTests: XCTestCase {

    func testStrength() throws {
        XCTAssertEqual(.onePair, Day7.Hand.parse("32T3K 765").strength)
        XCTAssertEqual(.twoPair, Day7.Hand.parse("KK677 765").strength)
        XCTAssertEqual(.twoPair, Day7.Hand.parse("KTJJT 765").strength)
        XCTAssertEqual(.threeOfAKind, Day7.Hand.parse("T55J5 765").strength)
        XCTAssertEqual(.threeOfAKind, Day7.Hand.parse("QQQJA 765").strength)
        
        XCTAssertTrue(Day7.HandStrength.fiveOfAKind > Day7.HandStrength.fourOfAKind)
    }
    
    func testSorting() throws {
        let hand1 = Day7.Hand.parse("32T3K 765")
        let hand2 = Day7.Hand.parse("KK677 765")
        let hand3 = Day7.Hand.parse("KTJJT 765")
        let hand4 = Day7.Hand.parse("T55J5 765")
        let hand5 = Day7.Hand.parse("QQQJA 765")
        
        let sorted = [hand1, hand2, hand3, hand4, hand5].sorted()
        
        XCTAssertEqual([hand1, hand3, hand2, hand4, hand5], sorted)
    }

    func testWinAmount() throws {
        let hand1 = Day7.Hand.parse("32T3K 765")

        XCTAssertEqual(765, hand1.winAmount(forRank: 1))
        XCTAssertEqual((4*765), hand1.winAmount(forRank: 4))
    }
    


}
