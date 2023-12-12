//
//  Tile.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 12/12/2023.
//

import Foundation

extension Day10 {
    
    struct Tile: Equatable {
        let coordinate: Coordinate
        let pipe: Pipe
        
        var isStart: Bool {
            return pipe == .start
        }
        
        func move(inLandscape landscape: Landscape, inDirection direction: Direction, tiles: [Tile]) -> [Tile] {
            if tiles.count > 1, let end = tiles.last, end.isStart {
                return tiles
            }
            let nextCoordinate = coordinate.move(inDirection: direction)

            let nextTile = landscape.tile(atCoordinate: nextCoordinate)!
            if nextTile.isStart {
                return tiles
            }

            let nextDirection = nextTile.pipe.endDirection(fromStart:  direction.opposite)!

            
            var copy = tiles
            copy.append(nextTile)
            return nextTile.move(inLandscape: landscape, inDirection: nextDirection, tiles: copy)
        }
                
        
    }

}
