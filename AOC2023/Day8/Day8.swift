import Foundation
struct Day8 {
    struct Part1 {
        static func stepCount(_ input: String) -> Int {
            let lines = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
            
            let instructions = Instructions.parse(lines[0])
            
            let network = Network.from(Array(lines.dropFirst()))
            return network.walk(withInstructions: instructions)
        }
             
    }
    
    struct Part2 {
        
        static func stepCount(_ input: String) async -> Int {
            let lines = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
            
            let instructions = Instructions.parse(lines[0])
            
            let network = Network.from(Array(lines.dropFirst()))
            return await network.walk2(withInstructions: instructions)
        }
    }
}
