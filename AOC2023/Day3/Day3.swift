import Foundation

struct Day3 {
    
    struct Part1 {
                
        static func sum(_ input: String) -> Int {
            let engine = Day3.EngineSchematic.fromInput(input)
            return engine
                .validPartNumbers()
                .map(\.value)
                .sum()
        }
    }
    
    struct Part2 {
        
        static func sum(_ input: String) -> Int {
            let engine = Day3.EngineSchematic.fromInput(input)
            return engine
                .gears()
                .reduce(0) { acc, next in
                    return acc + next.ratio
                }
        }
    }
}
