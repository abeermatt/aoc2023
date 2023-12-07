//
//  HandType.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 07/12/2023.
//

import Foundation

extension Day7 {
    enum HandStrength {
        case highCard
        case onePair
        case twoPair
        case threeOfAKind
        case fullHouse
        case fourOfAKind
        case fiveOfAKind
                
        static func from(_ cards: [Card]) -> Self {
            let groups = Dictionary(grouping: cards, by: { $0 })
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
extension Day7.HandStrength: Comparable {}
