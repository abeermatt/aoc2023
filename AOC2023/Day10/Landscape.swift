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
