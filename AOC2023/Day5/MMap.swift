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
        
        func getDestination(forSource source: Int) -> Int {
            if let destination = ranges.compactMap({ $0.getDestination(forSource: source) }).first {
                return destination
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
            
            return MMap(ranges: ranges)
        }

    }
}
