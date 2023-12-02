//
//  String+Extensions.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 02/12/2023.
//

import Foundation

extension String {
    func takePrefix(_ prefix: String) -> String {
        if prefix.isEmpty {
            return self
        }
        if hasPrefix(prefix) {
            let start = self.index(self.startIndex, offsetBy: prefix.lengthOfBytes(using: .utf8))
            return String(self[start...])
        }
        return self
    }
    
    func takeSuffix(_ suffix: String) -> String {
        if suffix.isEmpty {
            return self
        }
        if hasSuffix(suffix) {
            let length = Int(-suffix.lengthOfBytes(using: .utf8))
            let end = self.index(self.endIndex, offsetBy: length, limitedBy: self.startIndex)!
            return String(self[..<end])
        }
        return self
    }
}


