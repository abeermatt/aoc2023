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
        static let regex = "one|two|three|four|five|six|seven|eight|nine"
        static let forwards = try! Regex(regex)
        static let backwards = try! Regex(String(regex.reversed()))
        
        static func extractCalibrationValue(from input: any StringProtocol, first: String?, last: String?) -> Int {
//            switch (first, last) {
//                case (nil, nil): print("no matches")
//                case (nil, last): print("last matche")
//                case (first, nil): print("first matche")
//                case (first, last): print("both matche")
//                default: print("default")
//            }
            
            if let first = first, let last = last {
                return Int("\(first)\(last)")!
            }
            if input.isEmpty {
                return Int("\(first ?? "")\(last ?? "")")!
            }
            if let first = first {
                if let candidate = lastMatch(input: input) {
                    return Int("\(first)\(candidate.0)")!
                }
                let endIndex = input.index(before: input.endIndex)
                return extractCalibrationValue(from: input[..<endIndex], first: first, last: nil)
            }
            if let last = last {
                if let candidate = firstMatch(input: input) {
                    return Int("\(candidate.0)\(last)")!
                }
                let startIndex = input.index(after: input.startIndex)
                return extractCalibrationValue(from: input[startIndex...], first: nil, last: last)
            }
            var startIndex = input.index(after: input.startIndex)
            var first: String? = nil
            
            var endIndex = input.index(before: input.endIndex)
            var last: String? = nil
            
            var x: any StringProtocol = input
            
            if let firstMatch = firstMatch(input: x) {
                first = firstMatch.0
                startIndex = input.index(input.startIndex, offsetBy: firstMatch.1)
                x = x[startIndex...]
            }
            
            if let lastMatch = lastMatch(input: x) {
                last = lastMatch.0
                endIndex = input.index(input.endIndex, offsetBy: Int(-lastMatch.1))
                x = x[..<endIndex]
            }


            return extractCalibrationValue(from: x, first: first, last: last)

        }
        
        static func firstNumber(input: any StringProtocol) -> String {
            return firstMatchX(input: input).1
        }
        
        static func lastNumber(input: any StringProtocol) -> String {
            return lastMatchX(input: input).1
        }
        
        static func firstMatchX(input: any StringProtocol) -> (any StringProtocol, String) {
            
            if let entry = mappings.first(where: {
                input.hasPrefix($0.key)
            }) {
                let length = entry.key.lengthOfBytes(using: .utf8)
                let index = input.index(input.startIndex, offsetBy: length, limitedBy: input.endIndex)!
                return (input[index...], entry.value)
            }
            let index = input.index(after: input.startIndex)
            return firstMatchX(input: input[index...])
        }

        static func lastMatchX(input: any StringProtocol) -> (any StringProtocol, String) {
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
            return lastMatchX(input: input[..<index])
        }

        
        static func firstMatch(input: any StringProtocol) -> (String, Int)? {
            if let entry = mappings.first(where: {
                input.hasPrefix($0.key)
            }) {
                return (entry.value, entry.key.lengthOfBytes(using: .utf8))
            }
            return nil
            

        }
        
        static func lastMatch(input: any StringProtocol) -> (String, Int)? {
            if let entry = mappings.first(where: {
                input.hasSuffix($0.key)
            }) {
                return (entry.value, entry.key.lengthOfBytes(using: .utf8))
            }
            return nil

        }


        static func extractCalibrationValue(from input: String) -> Int {
            print("input: \(input)")
            let first = firstMatchX(input: input)
            print("first \(first)")
            let last = lastMatchX(input: first.0)
            print("last \(last)")
            return Int("\(first.1)\(last.1)")!
            
//            return extractCalibrationValue(from: input, first: nil, last: nil)
//            let x = replaceFirstWordWithNumbers(forInput: input)
//            let y = replaceLastWordWithNumbers(forInput: x)
//            return Part1.pickCalibrationValue(line: y)
        }
        
        static func replaceFirstWordWithNumbers(forInput input: String) -> String {
            let matches = input.matches(of: forwards)
            if let first = matches.min(by: { $0.startIndex < $1.startIndex }) {
                let value = String(input[first.range])
                return input.replacingCharacters(in: first.range, with: mappings[value]!)
            }
            return input
        
        }
        
        static func replaceLastWordWithNumbers(forInput input: String) -> String {
            let reversed = String(input.reversed())
            let matches = reversed.matches(of: backwards)
            if let first = matches.min(by: { $0.startIndex < $1.startIndex }) {
                print("first \(first.startIndex) \(first.endIndex)")
                let value = String(reversed[first.range].reversed())
                print(value)
//                return reversed.replacingCharacters(in: first.range, with: mappings[value]!.rev)
            }
            return input
        
        }

            
    
    }
    
    
}

