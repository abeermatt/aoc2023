import Foundation
struct Day16 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            var grid = Grid.parse(input)
            grid.visit()
            return grid.energisedCount
        }
             
    }
    
    struct Part2 {        
        static func run(_ input: String) -> Int {
            return 0
        }
    }
}
