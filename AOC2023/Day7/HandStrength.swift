//
//  HandType.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 07/12/2023.
//

import Foundation

extension Day7 {
    enum HandStrength {
        case highCard // XABCD
        case onePair // XXABC
        case twoPair // XXAAC
        case threeOfAKind // XXXAC
        case fullHouse // XXXAA
        case fourOfAKind // XXXXA
        case fiveOfAKind // XXXXX
        
        func withJokers(_ count: Int) -> Self {
            if count == 0 {
                return self
            }
            switch self {
            case .fiveOfAKind: return .fiveOfAKind
            case .fourOfAKind: return .fiveOfAKind
            case .fullHouse: return .fiveOfAKind
            case .threeOfAKind: return .fourOfAKind
            case .twoPair: return count == 1 ? .fullHouse : .fourOfAKind
            case .onePair: return .threeOfAKind
            case .highCard: return .onePair
            }
        }
                
        static func from(_ cards: [Card], usingJokerAsWildcard: Bool = false) -> Self {
            let groups = Dictionary(grouping: cards, by: { $0 })
            let strength = strengthForGroups(groups)
            if usingJokerAsWildcard {
                let numberJokers = groups[Card.J]?.count ?? 0
                let strength = strength.withJokers(numberJokers)
                return strength
            }
            return strength
        }
        
        private static func strengthForGroups(_ groups: Dictionary<Day7.Card, [Day7.Card]>) -> Self {
            switch groups.count {
            case 5: return .highCard
            case 4: return .onePair
            case 3: return isXOfKind(3, groups) ? .threeOfAKind : .twoPair
            case 2: return isXOfKind(4, groups) ? .fourOfAKind : .fullHouse
            case 1: return .fiveOfAKind
            default: return .highCard
            }
        }
        
        static func isXOfKind(_ x: Int, _ groups: Dictionary<Day7.Card, [Day7.Card]>) -> Bool {
            return groups.contains(where: { $0.value.count == x })
        }
    }
}
extension Day7.HandStrength: Comparable {
}
