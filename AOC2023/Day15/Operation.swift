//
//  Operation.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 03/01/2024.
//

import Foundation

extension Day15 {
    enum Operation: Equatable {
        static let operations = CharacterSet(charactersIn: "=-")
        
        case dash(String)
        case equals(String, Int)
        
        var lens: String {
            switch self {
            case .dash(let label): return label
            case .equals(let label, _): return label
            }
        }
        
        static func parse(_ input: any StringProtocol) -> Self {
            
            let parts = input.components(separatedBy: operations)
            let label = parts[0]
            if let length = Int(parts[1]) {
                return .equals(label, length)
            }
            return .dash(label)
        }
        

    }

}
