//
//  Direction.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 12/12/2023.
//

import Foundation

extension Day10 {
    enum Direction: CaseIterable {
        case north
        case south
        case west
        case east
        
        var opposite: Direction {
            switch self {
            case .north: return .south
            case .south: return .north
            case .west: return .east
            case .east: return .west
            }
        }
        
    }
        

}
