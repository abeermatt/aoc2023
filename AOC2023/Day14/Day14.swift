import Foundation
struct Day14 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            return Platform.parse(input).tiltNorth().sumOfLoads()
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            return 0
        }
    }
}
