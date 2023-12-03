//
//  Record.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 02/12/2023.
//

import Foundation

extension Day2.Part1 {

    struct Record: Equatable {
        
        static var zero: Self = Record(red: 0, blue: 0, green: 0)
        
        let red: Int
        let blue: Int
        let green: Int
        
        func isPossible(red: Int, blue: Int, green: Int) -> Bool {
            return self.red <= red && self.blue <= blue && self.green <= green
        }
        
        var power: Int {
            return red * blue * green
        }
        
        static func fromSet(_ set: String) -> Self {
            let colours = set.components(separatedBy: ", ")
                .reduce(into: [String:Int]()) { acc, group in
                    let parts = group.components(separatedBy: .whitespaces)
                    let count = Int(parts[0])!
                    let colour = parts[1]
                    acc.updateValue(count, forKey: colour)
                    
                }
            return Record(red: colours["red"] ?? 0, blue: colours["blue"] ?? 0, green: colours["green"] ?? 0)
        }
    }

}

