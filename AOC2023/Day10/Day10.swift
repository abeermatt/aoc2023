import Foundation
struct Day10 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            let landscape = Landscape.parse(input)
            return landscape.furthest()
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            return 0
        }
    }
}
