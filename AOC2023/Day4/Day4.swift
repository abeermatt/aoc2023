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
    
    struct Part2 {
        
        static func numberOfScratchcards(_ input: String) -> Int {
            let lookup = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .enumerated()
                .reduce(into: [Int:Int]()) { acc, pair in
                    let (game, line) = pair
                    acc[game] = matchesOnLine(line).count
                }
            
            let copies = lookup
                .sorted(by: { $0.key < $1.key })
                .reduce(into: [Int: Int]()) { acc, pair in
                    let (game, matches) = pair
                    
                    acc[game] = acc[game] ?? 0
                    acc[game]! += 1

                    for _ in 0..<(acc[game]!) {
                        for j in 0..<matches {
                            let index = j + game + 1
                            acc[index] = acc[index] ?? 0
                            acc[index]! += 1
                        }
                    }
                }
                .tap { print($0) }
                
                return copies.reduce(0) { acc, next in
                    acc + next.value
                }
        }
                
        static func matchesOnLine(_ line: String) -> Set<Int> {
            let parts = line.components(separatedBy: "|")
            let gameNumbers = parts[0].components(separatedBy: ":")[1]
            let drawnNumbers = parts[1]
            return ScratchCard.fromInput(gameNumbers).matches(in: drawnNumbers)
        }

    }
}
