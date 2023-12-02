//
//  Day1.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 29/11/2023.
//

import Foundation

struct Day1 {
    
    struct Part1 {
        static func run(_ input: String) -> Int {
            return input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map(pickCalibrationValue(line:))
                .sum()
        }
            
        static func pickCalibrationValue(line: String) -> Int {
            let first = line[line.firstIndex(where: \.isNumber)!]
            let last = line[line.lastIndex(where: \.isNumber)!]
            let value = Int("\(first)\(last)")!
            return value
        }

    }
    
    struct Part2 {
        static func run(_ input: String) -> Int {
            return input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map(extractCalibrationValue(from:))
                .sum()
        }
        
        static var mappings: [String: String] {
            return [
                "one": "1",
                "two": "2",
                "three": "3",
                "four": "4",
                "five": "5",
                "six": "6",
                "seven": "7",
                "eight": "8",
                "nine": "9",
                "1": "1",
                "2": "2",
                "3": "3",
                "4": "4",
                "5": "5",
                "6": "6",
                "7": "7",
                "8": "8",
                "9": "9",
            ]
        }
        
        static func firstMatch(input: any StringProtocol) -> (any StringProtocol, String) {
            
            if let entry = mappings.first(where: {
                input.hasPrefix($0.key)
            }) {
                let length = entry.key.lengthOfBytes(using: .utf8)
                let index = input.index(input.startIndex, offsetBy: length, limitedBy: input.endIndex)!
                return (input[index...], entry.value)
            }
            let index = input.index(after: input.startIndex)
            return firstMatch(input: input[index...])
        }

        static func lastMatch(input: any StringProtocol) -> (any StringProtocol, String) {
            if input.isEmpty {
                return (input, "")
            }
            
            if let entry = mappings.first(where: {
                input.hasSuffix($0.key)
            }) {
                let length = entry.key.lengthOfBytes(using: .utf8)
                let index = input.index(input.endIndex, offsetBy: Int(-length), limitedBy: input.startIndex)!
                return (input[..<index], entry.value)
            }
            let index = input.index(before: input.endIndex)
            return lastMatch(input: input[..<index])
        }

        static func extractCalibrationValue(from input: String) -> Int {
            print("input: \(input)")
            let first = firstMatch(input: input)
            print("first \(first)")
            let last = lastMatch(input: first.0)
            print("last \(last)")
            return Int("\(first.1)\(last.1)")!
        }
        
    
    }
    
    
}

