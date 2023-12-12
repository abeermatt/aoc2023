//
//  Landscape.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 12/12/2023.
//

import Foundation
extension Day10 {
    
    struct Landscape {
/*
-L|F7
7S-7|
L|7||
-L-J|
L|-JF
*/

        let tiles: [[Tile]]
        let start: Tile
        
        init(tiles: [[Tile]]) {
            self.tiles = tiles
            self.start = Self.findStart(tiles)
        }
        
        private static func findStart(_ tiles: [[Tile]]) -> Tile {
            return tiles.compactMap { row in
                row.first(where: \.isStart)
            }.first!
        }
                
        func walk() -> [Tile] {
//            print("start \(start)")
            var direction = Direction.allCases.first { direction in
//                print("direction \(direction)")
                let nextCoordinate = start.coordinate.move(inDirection: direction)
//                print("nextCoordinate \(nextCoordinate)")
                if let nextTile = self.tile(atCoordinate: nextCoordinate) {
                    let valid = start.pipe.canConnect(with: nextTile.pipe, fromDirection: direction.opposite)
//                    print("nextTile \(nextTile), valid \(valid)")
                    return valid
                }
                return false
            }!
            
            var tile = start
            var tiles: [Tile] = []
            
            while true {
                let nextCoordinate = tile.coordinate.move(inDirection: direction)
                tiles.append(tile)
                tile = self.tile(atCoordinate: nextCoordinate)!
                if tile.isStart {
                    break
                }
                direction = tile.pipe.endDirection(fromStart:  direction.opposite)!
            }
            return tiles
        }
        
        func furthest() -> Int {
            let tiles = walk()
            return tiles.count / 2
        }
        
        func area(path: [Tile]) -> Int {
            let first = path.first!
            let last = path.last!
            let rest = path.dropFirst()
            
            let initialPart1 = last.coordinate.x * first.coordinate.y
            let initialPart2 = last.coordinate.y * first.coordinate.x
            
            let initial: (Tile, Int, Int) = (first, initialPart1, initialPart2)
            let (_, part1, part2) = rest.reduce(initial) { acc, next in
                let (previous, part1, part2) = acc
                let x1 = previous.coordinate.x
                let y1 = previous.coordinate.y
                let x2 = next.coordinate.x
                let y2 = next.coordinate.y
                
                
                return (next, part1 + (x1 * y2), part2 + (y1 * x2))
            }
            
            return (part1 - part2) / 2
        }
        
        func interiorPoints() -> Int {
            let tiles = walk()
            let area = area(path: tiles)
            return abs(area) - (tiles.count-1)/2
        }
        
        func countEnclosedTiles() -> Int {
            let path = walk().reduce(into: Set<Coordinate>()) { acc, next in
                acc.insert(next.coordinate)
            }
            
            let initial: ((Int, Int), (Int, Int)) = ((Int.max, Int.min), (Int.max, Int.min))
            let ((minX, maxX), (minY, maxY)) = path.reduce(initial) { acc, next in
                let ((minX, maxX), (minY, maxY)) = acc
                
                return ((min(minX, next.x), max(maxX, next.x)), (min(minY, next.y), max(maxY, next.y)))
            }
            
            let xRange = minX..<maxX
            let yRange = minY..<maxY
            print("xRange \(xRange)")
            print("yRange \(yRange)")

            var total = 0
            
            for row in 0..<tiles.count {
                print("checkign row \(row)")
                guard yRange.contains(row) else {
                    continue
                }
                let cols = tiles[row]
                let colsCount = cols.count
                for col in 0..<colsCount {
                    guard xRange.contains(col) else {
                        continue
                    }

                    let range = col..<colsCount
                    let remaining = Array(cols[range])
                    if !path.contains(.init(x: col, y: row)) {
                        let intersections = intersections(for: remaining, withPath: path)
                        if intersections % 2 == 1 {
                            print("(\(row), \(col)) = \(intersections)")
                            total += 1
                        }
                    }
                    
                }
            }
            
            return total
        }
        
        func intersections(for tiles: [Tile], withPath path: Set<Coordinate>) -> Int {
            return tiles.reduce(0) { acc, next in
                if path.contains(next.coordinate) {
                    return acc + 1
                }
                return acc
            }
        }
        
        func tile(atCoordinate coordinate: Coordinate) -> Tile? {
            let row = coordinate.y
            let column = coordinate.x
            if row < tiles.count && column < tiles[row].count {
                return tiles[row][column]
            }
            
            return nil
        }
                                
        static func parse(_ input: String) -> Self {
            let tiles = input
                .components(separatedBy: .newlines)
                .enumerated()
                .map { rowPair in
                    let (row, line) = rowPair
                    return line
                        .enumerated()
                        .map { columnPair in
                            let (col, char) = columnPair
                            return Tile(coordinate: .init(x: col, y: row), pipe: .init(rawValue: char)!)

                    }
                }
            return .init(tiles: tiles)
        }

    }

}
