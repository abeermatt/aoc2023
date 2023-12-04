//
//  Gear.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 04/12/2023.
//

import Foundation

extension Day3 {
    
    struct Gear: Equatable {
        let left: Day3.PartNumber
        let right: Day3.PartNumber
        
        var ratio: Int {
            return left.value * right.value
        }
    }
}
