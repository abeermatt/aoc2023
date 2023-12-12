//
//  Coordinate.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 12/12/2023.
//

import Foundation

extension Day10 {
    struct Coordinate: Equatable, Hashable {
        let x: Int
        let y: Int
        
    
        func move(inDirection direction: Direction) -> Self {
            
            switch direction {
            case .north: return .init(x: x, y: y - 1)
            case .south: return .init(x: x, y: y + 1)
            case .west: return .init(x: x - 1, y: y)
            case .east: return .init(x: x + 1, y: y)
            }

        }
    }

}
