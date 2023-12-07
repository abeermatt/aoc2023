import Foundation
struct Day7 {
    struct Part1 {
        static func totalWinnings(_ input: String) -> Int {
            return input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map { Day7.Hand.parse($0, usingJokerAsWildcard: false) }
                .sorted()
                .enumerated()
                .map { pair in
                    let (index, hand) = pair
                    let rank = (index + 1)
                    return hand.winAmount(forRank: rank)
                }
                .sum()
        }
        
    }
    
    struct Part2 {
        
        static func totalWinnings(_ input: String) -> Int {
            return input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map { Day7.Hand.parse($0, usingJokerAsWildcard: true) }
                .sorted()
                .enumerated()
                .map { pair in
                    let (index, hand) = pair
                    let rank = (index + 1)
                    return hand.winAmount(forRank: rank)
                }
                .sum()
        }
    }
}
