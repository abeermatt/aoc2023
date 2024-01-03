import Foundation
struct Day15 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            return input
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .split(separator: ",")
                .map(Algorithm.hash(_:))
                .reduce(0) { acc, next in
                    return acc + Int(next)
                }
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            let sequence = InitializationSequence.parse(input)
            return sequence.totalFocussingPower()
        }
    }
}
