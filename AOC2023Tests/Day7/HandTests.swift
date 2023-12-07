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
    
    func testSortingUsingJokers() throws {
        let hand1 = Day7.Hand.parse("32T3K 765", usingJokerAsWildcard: true)
        let hand2 = Day7.Hand.parse("T55J5 765", usingJokerAsWildcard: true)
        let hand3 = Day7.Hand.parse("KK677 765", usingJokerAsWildcard: true)
        let hand4 = Day7.Hand.parse("KTJJT 765", usingJokerAsWildcard: true)
        let hand5 = Day7.Hand.parse("QQQJA 765", usingJokerAsWildcard: true)
        
        let sorted = [hand1, hand2, hand3, hand4, hand5].sorted()
        
        XCTAssertEqual([hand1, hand3, hand2, hand5, hand4], sorted)
    }
    
    func xtestHandComparison() throws{
        XCTAssertTrue(Day7.Hand.parse("J2T3K 765", usingJokerAsWildcard: true) < Day7.Hand.parse("32TJK 765", usingJokerAsWildcard: true))
        XCTAssertTrue(Day7.Hand.parse("3JT3K 765", usingJokerAsWildcard: true) < Day7.Hand.parse("32TJK 765", usingJokerAsWildcard: true))
    }

    
    func testStrengthIncludingJokers() throws {
        XCTAssertEqual(.onePair, Day7.Hand.parse("32T3K 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.threeOfAKind, Day7.Hand.parse("J2TJK 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.threeOfAKind, Day7.Hand.parse("3JT3K 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.threeOfAKind, Day7.Hand.parse("32J3K 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.threeOfAKind, Day7.Hand.parse("32T3J 765", usingJokerAsWildcard: true).strength)
        
        XCTAssertEqual(.twoPair, Day7.Hand.parse("KK677 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fourOfAKind, Day7.Hand.parse("JJ677 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fullHouse, Day7.Hand.parse("KKJ77 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fourOfAKind, Day7.Hand.parse("KK6JJ 765", usingJokerAsWildcard: true).strength)
        
        XCTAssertEqual(.fullHouse, Day7.Hand.parse("KKJ77 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fiveOfAKind, Day7.Hand.parse("KKJJJ 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.threeOfAKind, Day7.Hand.parse("KKJAQ 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fourOfAKind, Day7.Hand.parse("KTJJT 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fourOfAKind, Day7.Hand.parse("T55J5 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fourOfAKind, Day7.Hand.parse("QQQJA 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fiveOfAKind, Day7.Hand.parse("QQQJQ 765", usingJokerAsWildcard: true).strength)
        XCTAssertEqual(.fiveOfAKind, Day7.Hand.parse("JJJJQ 765", usingJokerAsWildcard: true).strength)
        
        XCTAssertEqual(.onePair, Day7.Hand.parse("59K7J 765", usingJokerAsWildcard: true).strength)
        
        XCTAssertTrue(Day7.HandStrength.fiveOfAKind > Day7.HandStrength.fourOfAKind)
    }


    func testWinAmount() throws {
        let hand1 = Day7.Hand.parse("32T3K 765")

        XCTAssertEqual(765, hand1.winAmount(forRank: 1))
        XCTAssertEqual((4*765), hand1.winAmount(forRank: 4))
    }
    


}
