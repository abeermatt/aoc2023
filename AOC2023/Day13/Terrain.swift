//
//  Terrain.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 14/12/2023.
//

import Foundation

extension Day13 {
    enum Reflection: Equatable {
        case horizontal(Int)
        case vertical(Int)
    }
    
    struct VerticalReflection: Hashable {
        let offset: Int
        let left: String
        let right: String
        
        func matches(inLine line: String) -> Bool {
            let index = line.index(line.startIndex, offsetBy: offset)
            let leftCandidate = line[line.startIndex..<index]
            let rightCandidate = line[index..<line.endIndex]
            return leftCandidate.hasSuffix(left) && rightCandidate.hasPrefix(right)
        }
    }
    
    struct Terrain {
        
        let lines: [String]
        
        func reflections() -> [Reflection] {
//            var previous = String(lines.first!)
            
//            return lines.reduce(into: Set<Int>()) { acc, line in
//                acc.formUnion(Self.detectVerticalReflection(inLine: line))
//            }
            
//            let initial
//            (lines[1...]).reduce(into: Set<Int>()) { acc, next in
//
//                if previous == next {
//                    acc.insert(<#T##newMember: Int##Int#>)
//                }
//            }
//            let columns = lines.reduce(Set<Int>()) { acc, next in
//                
//            }
            
            return []
        }
        
//        static func detectRelections(inLines lines: [String]) -> Set<Int> {
//            let reflections = Self.detectVerticalReflection(inLine: lines.first!)
//            
//            print("found reflections \(reflections)")
//            let rest = lines.dropFirst()
//            
////            return lines.reduce(into: Set<Int>()) { acc, line in
////                acc.formUnion(Self.detectVerticalReflection(inLine: line))
////            }
//        }
        
        static func detectVerticalReflection(inInput lines: [String]) -> Set<Int> {
            let first = lines.first!
            var columns = detectVerticalReflection(inLine: first)
            
            for line in lines {
                var mutable = columns
                
                for column in columns {
                    if !hasReflection(inLine: line, atOffset: column) {
                        mutable.remove(column)
                    }
                }
                columns.formIntersection(mutable)
                if columns.isEmpty {
                    break
                }

            }
            return columns
        }
        
        
        static func detectVerticalReflection(inLine line: String) -> Set<Int> {
            var matches = Set<Int>()
            
            for i in 1..<line.count {
                if hasReflection(inLine: line, atOffset: i) {
                    matches.insert(i)
                }
            }
            
            return matches
            
        }
        
        static func hasReflection(inLine line: String, atColumn column: Int) -> Bool {
            if column == 0 || column >= line.count - 1 {
                return false
            }
//            print("### column \(column)")
            
            let distanceFromStart = column
            let distanceFromEnd = (line.count - column)
            let offset = max(distanceFromStart - distanceFromEnd, 0)
            let size = min(distanceFromStart, distanceFromEnd)
            
//            print("distanceFromStart \(distanceFromStart) distanceFromEnd: \(distanceFromEnd) line.count \(line.count) offset: \(offset) size \(size)")

            let start = line.index(line.startIndex, offsetBy: offset)
            let middle = line.index(line.startIndex, offsetBy: column, limitedBy: line.endIndex) ?? line.endIndex
            
            let end = line.index(middle, offsetBy: column, limitedBy: line.endIndex) ?? line.endIndex

//            print("offset \(offset) start: \(start) middle: \(middle) end: \(end)")
            
            let leftRange = start..<middle
            let rightRange = middle..<end

            let left = String(line[leftRange])
            let right = String(line[rightRange].reversed())
            
//            print("left: \(left) right: \(right)")
            
            return left == right
        }
        
//        static func rangesForReflection(inLine line: String, atColumn column: Int) -> (Range<String.Index>, Range<String.Index>) {
//            
//        }

        
        static func hasReflection(inLine line: String, atOffset offset: Int) -> Bool {
            let start = line.startIndex
            let middle = line.index(line.startIndex, offsetBy: offset)
            let end = line.index(middle, offsetBy: offset, limitedBy: line.endIndex) ?? line.endIndex
            
            let length = min(offset, line.count - offset)
            let left = String(line[start..<middle]).suffix(length)
            let right = String(line[middle..<end].reversed()).prefix(length)
            
//            print("left: \(left) right: \(right)")
            
            
            return left == right
        }
                
        static func parse(_ input: String) -> Self {
            return .init(lines: [])
        }
        
    }
}
