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
        
        var isGround: Bool {
            return pipe == .ground
        }
        
        func moveForward(inLandscape landscape: Landscape, inDirection direction: Direction) -> Tile? {
            return nil
//            pipe.
        }
    }

}
