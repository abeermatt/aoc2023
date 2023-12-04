//
//  Day4.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 04/12/2023.
//

import Foundation

struct Day4 {
    
    struct Part1 {
        
        static func worth(_ input: String) -> Int {
            return input.components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map { line in
                    let matches = matchesOnLine(line)
                    if matches.isEmpty {
                        return 0
                    }
                    let power = max(0, matches.count - 1)
                    let worth = Int(pow(Double(2), Double(power)))
                    return worth

                }
                .sum()
        }
        
        static func matchesOnLine(_ line: String) -> Set<Int> {
            let parts = line.components(separatedBy: "|")
            let gameNumbers = parts[0].components(separatedBy: ":")[1]
            let drawnNumbers = parts[1]
            return ScratchCard.fromInput(gameNumbers).matches(in: drawnNumbers)
        }
        
    }
}
