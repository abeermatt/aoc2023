//
//  MMap.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 05/12/2023.
//

import Foundation

extension Day5 {
    
    struct MMap {
        
        let ranges: [MRange]
        let sourceRange: Range<Int>
        
        func getDestination(forSource source: Int) -> Int {
            guard sourceRange.contains(source) else {
                return source
            }
            if let match = ranges.first(where: { $0.getDestination(forSource: source) != nil }) {
                return match.getDestination(forSource: source)!
            }
            return source
        }
        
        static func fromInput(_ input: String) -> Self {
            return fromArray(input.components(separatedBy: .newlines))
        }
        
        static func fromArray(_ input: Array<String>) -> Self {
            let ranges = input
                .reject(\.isEmpty)
                .map(MRange.fromInput(_:))
                .sorted(by: { $0.sourceRange.startIndex < $1.sourceRange.startIndex})
            
            let minimumIndex = ranges.first!.sourceRange.startIndex
            let maximumIndex = ranges.last!.sourceRange.endIndex
            
            print("minimumIndex: \(minimumIndex), maximumIndex \(maximumIndex)")
            
            return MMap(ranges: ranges, sourceRange: minimumIndex..<maximumIndex)
        }

    }
}
