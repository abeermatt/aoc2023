import Foundation
import Algorithms

extension Day11 {
    
    struct Universe {
        
        let grid: [[Occupier]]
        let galaxies: [Int: Galaxy]
        
        init(grid: [[Occupier]]) {
            self.grid = grid
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
        
        func expanded() -> Self {
            return self
                .duplicateEmptyColumns()
                .duplicateEmptyRows()
                .adjustCoordinates()
        }
        
        private func duplicateEmptyColumns() -> Self {
            var columnsToExpand: [Int] = []
            for (index, _) in grid.first!.enumerated() {
                let column = grid.map { $0[index] }
                if column.allSatisfy(\.isSpace) {
                    columnsToExpand.append(index + columnsToExpand.count)
                }
            }
            let expanded = columnsToExpand.reduce(grid) { grid, columnIndex in
                return grid.map { $0.duplicateElement(at: columnIndex) }
            }
            return .init(grid: expanded)
        }
        
        private func duplicateEmptyRows() -> Self {
            var rowsToExpand: [Int] = []
            for (index, row) in grid.enumerated() {
                if row.allSatisfy(\.isSpace) {
                    rowsToExpand.append(index + rowsToExpand.count)
                }
            }
            let expanded = rowsToExpand.reduce(grid) { $0.duplicateElement(at: $1) }

            return .init(grid: expanded)
        }
        
        private func adjustCoordinates() -> Self {
            let updated = grid
                .enumerated()
                .map { (row, line) in
                    return line
                        .enumerated()
                        .map { (col, occupier) in
                            switch occupier {
                            case .galaxy(let galaxy):
                                return Occupier.galaxy(galaxy.withCoordinates(x: col, y: row))
                            case .space:
                                return Occupier.space
                            }
                        }
                }
            return .init(grid: updated)
        }
                
        func distance(betweenGalaxyAt start: Int, and end: Int) -> Int {
            let startCoordinate = galaxies[start]!.coordinate
            let endCoordinate = galaxies[end]!.coordinate
            return abs(endCoordinate.x - startCoordinate.x) + abs(endCoordinate.y - startCoordinate.y)
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

