import Foundation
struct Day9 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            let oasis = Oasis.parse(input)
            return oasis.sumOfNextValues()
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            let oasis = Oasis.parse(input)
            return oasis.sumOfPreviousValues()
        }
    }
}
