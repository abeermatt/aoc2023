//
//  Array+Extensions.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 30/11/2023.
//

import Foundation

extension Array {
    func groupBy(_ fn: (ArrayLiteralElement) -> Bool) -> [[ArrayLiteralElement]] {
        return groupBy(fn, transform: { x in x })
    }
    
    func groupBy<T>(_ fn: (ArrayLiteralElement) -> Bool, transform: (ArrayLiteralElement) -> T) -> [[T]] {
        return self.reduce(into: [[T]()]) { acc, line in
            if fn(line) {
                acc.append([])
            } else if var last = acc.popLast() {
                last.append(transform(line))
                acc.append(last)
            }
        }
    }
    
    
}

extension Array where ArrayLiteralElement == Int {
    
    func sum() -> Int {
        return self.reduce(0, +)
    }
    
}

extension Sequence {
    
    func reject(_ fn: (Element) -> Bool) -> [Element] {
        return filter { !fn($0) }
    }
    
    func tap(_ fn: (Element) -> Void) -> [Element] {
        return map {
            fn($0)
            return $0
        }
    }
    
}
