import Foundation

struct Day3 {
    
    struct Part1 {
        
        static func invalidPartNumbers(_ input: String) -> [Int] {
            return []
        }
        
        static func sum(_ input: String) -> Int {
            let engine = Day3.EngineSchematic.fromInput(input)
            return engine
                .validPartNumbers()
                .map(\.value)
                .tap { print($0) }
                .sum()
        }
    }
    
}
