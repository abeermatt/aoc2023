//
//  Game.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 02/12/2023.
//

import Foundation

extension Day2 {
    
    struct Game {
        
        let id: Int
        let records: [Day2.Record]

        func isPossible(red: Int, blue: Int, green: Int) -> Bool {
            return records.allSatisfy({ record in record.isPossible(red: red, blue: blue, green: green)})
        }
        
        var fewestNumber: Day2.Record {
            return records.reduce(.zero) { acc, next in
                return Day2.Record(
                    red: max(acc.red, next.red),
                    blue: max(acc.blue, next.blue),
                    green: max(acc.green, next.green))
            }
        }
        
        static func fromLine(_ line: String) -> Self {
            let parts = line.components(separatedBy: ": ")
            let game = parts[0].replacingOccurrences(of: "Game ", with: "")
            let sets = parts[1].components(separatedBy: "; ")
            return Game(id: Int(game)!, records: sets.map(Day2.Record.fromSet))
        }
    }

}
