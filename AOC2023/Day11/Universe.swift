import Foundation
import Algorithms

extension Day11 {
    
    struct Universe {
        
        let grid: [[Occupier]]
        let columnsToExpand: [Int]
        let rowsToExpand: [Int]
        let galaxies: [Int: Galaxy]
        let expansion: Int
        
        init(grid: [[Occupier]], expansion: Int = 2) {
            self.grid = grid
            self.columnsToExpand = Self.detectColumnsToExpand(grid)
            self.rowsToExpand = Self.detectRowsToExpand(grid)
            self.galaxies = grid.reduce([:]) { acc, row in
                return row.reduce(acc) { acc, col in
                    if case let .galaxy(galaxy) = col {
                        var copy = acc
                        copy[galaxy.id] = galaxy
                        return copy
                    }
                    return acc
                }
            }
            self.expansion = expansion
        }
        
        func prettyPrinted() -> String {
            return grid
                .reduce(into: []) { acc, next in
                    let line = next.reduce(into: "") { acc, occupier in
                        acc.append(occupier.description)
                    }
                    acc.append(line)
                }
                .joined(separator: "\n")
        }
                
        private static func detectColumnsToExpand(_ grid: [[Occupier]]) -> [Int] {
            var columnsToExpand: [Int] = []
            for (index, _) in grid.first!.enumerated() {
                let column = grid.map { $0[index] }
                if column.allSatisfy(\.isSpace) {
                    columnsToExpand.append(index)
                }
            }
            return columnsToExpand
        }
        
        private static func detectRowsToExpand(_ grid: [[Occupier]]) -> [Int] {
            var rowsToExpand: [Int] = []
            for (index, row) in grid.enumerated() {
                if row.allSatisfy(\.isSpace) {
                    rowsToExpand.append(index)
                }
            }
            return rowsToExpand
        }
        
        func coordinate(forGalaxy id: Int) -> Coordinate {
            return adjustCoordinate(galaxies[id]!.coordinate)
        }
                
        func adjustCoordinate(_ coordinate: Coordinate) -> Coordinate {
            
            let blankColumns = columnsToExpand.filter { $0 < coordinate.x }.count
            let blankRows = rowsToExpand.filter { $0 < coordinate.y }.count

            let xAdjustment = (blankColumns * expansion) - (blankColumns * 1)
            let yAdjustment = (blankRows * expansion) - (blankRows * 1)

            return .init(x: coordinate.x + xAdjustment, y: coordinate.y + yAdjustment)
        }

        func distance(betweenGalaxyAt start: Int, and end: Int) -> Int {
            let startCoordinate = coordinate(forGalaxy: start)
            let endCoordinate = coordinate(forGalaxy: end)

            return abs(endCoordinate.x - startCoordinate.x) + abs(endCoordinate.y - startCoordinate.y)
        }
        
        func expanded(by count: Int) -> Self {
            return .init(grid: grid, expansion: count)
        }
        
        func pairs() -> [(Galaxy, Galaxy)] {
            return galaxies.values.combinations(ofCount: 2).map { ($0[0], $0[1])}
        }
        
        func sumOfShortestPaths() -> Int {
            return pairs().reduce(0) { acc, next in
                let (g1, g2) = next
                let distance = distance(betweenGalaxyAt: g1.id, and: g2.id)
                return acc + distance
            }
        }
        
        static func parse(_ input: String) -> Self {
            var id = 0
            let grid = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .enumerated()
                .map { (row, line) in
                    return line
                        .enumerated()
                        .compactMap { (col, cell) in
                        switch cell {
                        case ".": return Occupier.space
                        case "#":
                            id += 1
                            return Occupier.galaxy(.init(coordinate: .init(x: col, y: row), id: id))
                        default: return nil
                        }
                    }
                }
            return .init(grid: grid)
        }
        
    }
    
    struct Coordinate: Equatable {
        let x: Int
        let y: Int
        
//        func distance(to: Self, adjustment: Int) -> Int {
//            return abs(endCoordinate.x - startCoordinate.x + columnsToExpand.count * expansion) + abs(endCoordinate.y - startCoordinate.y + rowsToExpand.count  * expansion)
//
//        }
    }
    
    struct Galaxy: Equatable {
        let coordinate: Coordinate
        let id: Int
        
        func withCoordinates(x: Int, y: Int) -> Self {
            return .init(coordinate: .init(x: x, y: y), id: id)
        }
    }
    
    enum Occupier: Equatable, CustomStringConvertible {
        case space
        case galaxy(Galaxy)
        
        var isSpace: Bool {
            return self == .space
        }
        
        var description: String {
            switch self {
            case .galaxy(let galaxy): return String(galaxy.id)
            case .space: return "."
            }
        }
        
    }
}

