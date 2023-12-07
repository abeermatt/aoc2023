import Foundation
extension Day7 {
    
    enum Card {
        case value(Int)
        case T
        case J
        case Q
        case K
        case A

        static func parse(_ value: Character) -> Self {
            switch value {
            case "A": return .A
            case "K": return .K
            case "Q": return .Q
            case "J": return .J
            case "T": return .T
            default: return .value(value.wholeNumberValue!)
            }
        }
    }
    
}

extension Day7.Card: Comparable, Hashable {}
