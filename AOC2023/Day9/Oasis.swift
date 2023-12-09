//
//  Oasis.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 09/12/2023.
//

import Foundation

extension Day9 {
    
    struct Oasis {
        
        let histories: [History]
        
        func sumOfNextValues() -> Int {
            return histories
                .map { $0.nextValue() }
                .sum()
        }
        
        func sumOfPreviousValues() -> Int {
            return histories
                .map { $0.previousValue() }
                .sum()
        }
        
        
        static func parse(_ input: String) -> Self {
            let histories = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map(History.parse(_:))
            return .init(histories: histories)
        }
        
    }
}
