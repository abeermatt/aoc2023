import Foundation
struct Day14 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            var platform = Platform.parse(input)
            platform.tiltNorth()
            return platform.sumOfLoads()
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            var platform = Platform.parse(input)
            platform.cycle(1000000000)
            return platform.sumOfLoads()
        }
    }
}
