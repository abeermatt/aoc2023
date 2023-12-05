//
//  Day4.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 04/12/2023.
//

import Foundation

struct Day5 {
    
    struct Part1 {

        static func lowestLocation(_ input: String) -> Int {
            let lines = input .components(separatedBy: .newlines)
            let seeds = lines[0]
                .takePrefix("seeds: ")
                .components(separatedBy: " ")
                .map { Int($0)! }
            let almanac = Day5.Almanac.fromArray(Array(lines[2...]))
            
            return seeds.map(almanac.getLocation(forSeed:)).min()!
        }
        
    }
    
    struct Part2 {
        

    }
}
