import Foundation

extension Day12 {
    
    enum Spring: Character, CaseIterable {
        case operational = "."
        case damaged = "#"
    }
}

extension Day12.Spring: CustomStringConvertible {
    var description: String {
        return String(rawValue)
    }
}
