import Foundation

extension Day12 {
    enum Status {
        case known(Spring)
        case unknown
        
        var isOperational: Bool {
            switch self {
            case .known(let spring): return spring == .operational
            default: return false
            }
        }
        
        static func parse(_ input: Character) -> Self? {
            if let spring = Spring(rawValue: input) {
                return .known(spring)
            }
            if input == "?" {
                return .unknown
            }
            return nil
        }
    }

}

extension Day12.Status: CustomStringConvertible {
    var description: String {
        switch self {
        case .known(let spring): return spring.description
        case .unknown: return "?"
        }
    }
}
