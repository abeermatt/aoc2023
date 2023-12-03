//
//  Day2.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 02/12/2023.
//

import Foundation

struct Day2 {
    
    struct Part1 {
                
        let games: [Game]
        
        
        func getPossibleGames(red: Int, green: Int, blue: Int) -> [Game] {
            return games.filter({ $0.isPossible(red: red, blue: blue, green: green)})
        }
        
        static func run(input: String, red: Int, green: Int, blue: Int) -> Int {
            let games = input.components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map(Game.fromLine(_:))
            
            return Part1(games: games).getPossibleGames(red: red, green: green, blue: blue)
                .map(\.id)
                .sum()
            
        }

    }
    
    struct Part2 {
                
        let games: [Day2.Game]
        
        static func sum(input: String) -> Int {
            return input.components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map(Day2.Game.fromLine(_:))
                .map(\.fewestNumber)
                .map(\.power)
                .sum()
        }

    }

}
