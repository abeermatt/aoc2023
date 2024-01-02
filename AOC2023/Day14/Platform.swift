import Foundation

extension Day14 {
    
    enum Direction {
        
    }
    
    struct Column {
        let obstacles: [Int]
        var rocks: [Int]
        var value: String

        func moveRock(atPosition position: Int, inDirection direction: Direction) {
            
        }
    }
        
    struct Platform: Equatable {
        
        static let immovableRocks = CharacterSet(charactersIn: "#")
                
        var columns: [String] {
            didSet {
                levels = updatedLevels()
            }
        }
        
        var vertical: [String: String] = [:]
        var horizontal: [String: String] = [:]
        var levelsCache: [[String]:[String]] = [:]
        var levels: [String] = []
        var north: [[String]: [String]] = [:]
        var west: [[String]: [String]] = [:]
        
        init(columns: [String]) {
            self.columns = columns
            self.levels = updatedLevels()
        }
        
        mutating func tiltNorth() {
            let original = columns
            if let cached = north[original] {
                columns = cached
                return
            }
            let tilted = columns.map { column in
                if let existing = vertical[column] {
                    return existing
                }
                let result = column.components(separatedBy: Self.immovableRocks)
                    .map { value in
                        let moveableRocks = value.filter { $0 == "O" }.count
                        let empty = value.count - moveableRocks
                        return String(repeating: "O", count: moveableRocks).appending(String(repeating: ".", count: empty))
                    }
                    .joined(separator: "#")
                
                vertical[column] = result
                return result
            }
            columns = tilted
            north[original] = columns
        }
        
        mutating func tiltWest() {
            let original = columns
            if let cached = west[original] {
                columns = cached
                return
            }
            let tilted = levels.map { value in
                if let existing = horizontal[value] {
                    return existing
                }
                let result = value
                    .components(separatedBy: Self.immovableRocks)
                    .map { value in
                        let moveableRocks = value.filter { $0 == "O" }.count
                        let empty = value.count - moveableRocks
                        return String(repeating: "O", count: moveableRocks).appending(String(repeating: ".", count: empty))
                    }
                    .joined(separator: "#")
                
                horizontal[value] = result
                return result
            }.rotate()
            columns = tilted
            west[original] = columns
        }
        
        mutating func tiltSouth() {
            let reversed = columns.map { String($0.reversed()) }
            columns = reversed
            tiltNorth()
            columns = columns.map { String($0.reversed()) }
        }

        mutating func tiltEast() {
            columns = columns.reversed()
            tiltWest()
            tiltWest()
            columns = columns.reversed()
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
            let index = levels.count - level
            let value = levels[index]
            let rocks = value.filter { $0 == "O" }
            return rocks.count
        }
        
        mutating func updatedLevels() -> [String] {
            guard let first = columns.first else {
                return []
            }
            if let existing = levelsCache[columns] {
                return existing
            }
            let levels = Array(repeating: "", count: first.count)
            let result = columns.reduce(into: levels) { acc, next in
                next.enumerated().forEach { (index, value) in
                    acc[index].append(value)
                }
            }
            
            levelsCache[columns] = result
            return result

        }
        
        mutating func cycle(_ times: Int) {
            for time in 0..<times {
                let x = time % 1000
                if x == 0 {
                    print("cycled \(time) times")
                }
                tiltNorth()
                tiltWest()
                tiltSouth()
                tiltEast()
            }
        }
        
        mutating func cycle() {
            let start = columns
            
            tiltNorth()
            tiltWest()
            tiltSouth()
            tiltEast()
            
            let end = columns
            
            
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
        return levels.joined(separator: "\n")
    }
}
