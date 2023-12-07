import Foundation

extension Day7 {
    
    struct Hand {
        
        let cards: [Card]
        let bid: Int
        let strength: HandStrength
                
        func winAmount(forRank rank: Int) -> Int {
            return bid * rank
        }
        
        static func parse(_ input: String, usingJokerAsWildcard: Bool = false) -> Self {
            let cards = input[input.startIndex..<input.index(input.startIndex, offsetBy: 5)].map(Card.parse)
            let bid = input[input.index(input.startIndex, offsetBy: 6)...]
            let strength = HandStrength.from(cards, usingJokerAsWildcard: usingJokerAsWildcard)
            return .init(cards: cards, bid: Int(bid)!, strength: strength)
        }
        
        
    }
    
}

extension Day7.Hand: CustomStringConvertible {
    
    var description: String {
        return "Hand { Cards: \(cards.map(\.description).joined(separator: "")), Strength: \(strength), Bid: \(bid) }"
    }
}

extension Day7.Hand: Comparable {
    static func < (lhs: Day7.Hand, rhs: Day7.Hand) -> Bool {
        let lhsStrength = lhs.strength
        let rhsStrength = rhs.strength
        if lhsStrength != rhsStrength {
            return lhsStrength < rhsStrength
        }
        for i in 0..<lhs.cards.count {
            let lhsCard = lhs.cards[i]
            let rhsCard = rhs.cards[i]
            if lhsCard != rhsCard {
                return lhsCard < rhsCard
            }
        }
        return false
        
    }
    
    
}
extension Day7 {
    
}
