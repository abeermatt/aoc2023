import Foundation

extension Day14 {
        
    struct Platform {
        
        static let immovableRocks = CharacterSet(charactersIn: "#")
                
        let columns: [String]
        
        func tiltNorth() -> Self {
            let tilted = columns.map { column in
                return column.components(separatedBy: Self.immovableRocks)
                    .map { value in
                        let moveableRocks = value.filter { $0 == "O" }.count
                        let empty = value.count - moveableRocks
                        return String(repeating: "O", count: moveableRocks).appending(String(repeating: ".", count: empty))
                    }
                    .joined(separator: "#")
                
            }
            return .init(columns: tilted)
        }
        
        func sumOfLoads() -> Int {
            let count = columns.first!.count
            return (1...count)
                .map(loadOfRoundRocks(atLevel:))
                .sum()
        }
        
        func loadOfRoundRocks(atLevel level: Int) -> Int {
            return roundRocks(atLevel: level) * level
        }
        
        func roundRocks(atLevel level: Int) -> Int {
            let levels = levels()
            let index = levels.count - level
            let value = levels[index]
            let rocks = value.filter { $0 == "O" }
            return rocks.count
        }
        
        func levels() -> [String] {
            guard let first = columns.first else {
                return []
            }
            let levels = Array(repeating: "", count: first.count)
            return columns.reduce(into: levels) { acc, next in
                next.enumerated().forEach { (index, value) in
                    acc[index].append(value)
                }
            }
        }
        
        static func parse(_ input: String) -> Self {
            let columns = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .rotate()
            return .init(columns: columns)
        }
        
    }
    
}

extension Day14.Platform: CustomStringConvertible {
    
    var description: String {
        return levels().joined(separator: "\n")
    }
}
