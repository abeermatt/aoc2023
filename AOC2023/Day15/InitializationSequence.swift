import Foundation

extension Day15 {
    
    struct InitializationSequence {
        
        let steps: [any StringProtocol]
        
        func hash() -> [UInt8] {
            return steps.map(Algorithm.hash(_:))
        }
        
        static func parse(_ input: String) -> Self {
            let steps = input
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .split(separator: ",")
                            
            return .init(steps: steps)
        }
    }
}
