import Foundation
struct Day12 {
    struct Part1 {
        static func run(_ input: String) async -> Int {
            let rows = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)

//            let records = Day12.Records.parse(input)
            return await Day12.Records.doIt(rows)
        }
             
    }
    
    struct Part2 {
        
        static func run(_ input: String) -> Int {
            return 0
        }
    }
}
