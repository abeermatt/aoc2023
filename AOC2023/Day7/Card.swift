import Foundation
extension Day7 {
    
    enum Card {
        case J
        case two
        case three
        case four
        case five
        case six
        case seven
        case eight
        case nine
        case T
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
            case "9": return .nine
            case "8": return .eight
            case "7": return .seven
            case "6": return .six
            case "5": return .five
            case "4": return .four
            case "3": return .three
            case "2": return .two
            default: return .two
            }
        }
        
    }
    
}

extension Day7.Card: Comparable, Hashable {}

extension Day7.Card: CustomStringConvertible {
    var description: String {
        switch self {
        case .J: return "J"
        case .T: return "T"
        case .A: return "A"
        case .Q: return "Q"
        case .K: return "K"
        case .nine: return "9"
        case .eight: return "8"
        case .seven: return "7"
        case .six: return "6"
        case .five: return "5"
        case .four: return "4"
        case .three: return "3"
        case .two: return "2"
        }
    }
}
