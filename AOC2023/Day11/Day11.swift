import Foundation
struct Day11 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            let universe = Day11.Universe.parse(input)
            return universe.sumOfShortestPaths()
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            let universe = Day11.Universe.parse(input).expanded(by: 1000000)
            return universe.sumOfShortestPaths()
        }
    }
}
