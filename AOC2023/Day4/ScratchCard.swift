//
//  ScratchCard.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 04/12/2023.
//

import Foundation

extension Day4 {
    
    struct ScratchCard {
        let numbers: Set<Int>
        
        func matches(in input: String) -> Set<Int> {
            let numbers = input
                .components(separatedBy: .whitespaces)
                .compactMap(Int.init)
            
            return self.numbers.intersection(numbers)
        }
        
        static func fromInput(_ input: String) -> Self {
            let numbers = input
                .components(separatedBy: .whitespaces)
                .compactMap(Int.init)
        
            return ScratchCard(numbers: Set(numbers))
        }
    }
    
}
