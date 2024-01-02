import Foundation
struct Day15 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            return InitializationSequence
                .parse(input)
                .hash()
                .reduce(0) { acc, next in
                    return acc + Int(next)
                }
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            return 0
        }
    }
}
