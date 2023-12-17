import Foundation
struct Day13 {
    struct Part1 {
        static func run(_ input: String) -> Int {
            let notes = Notes.parse(input)
            return notes.sum()
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            return 0
        }
    }
}
