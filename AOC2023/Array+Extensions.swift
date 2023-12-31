//
//  Array+Extensions.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 30/11/2023.
//

import Foundation

extension Array {
    
    func chunk(every size: Int) -> [[Element]] {
        if size >= self.count {
            return [self]
        }
        let initial: ([Element], [[Element]]) = ([], [])
        var (wip, result) = self
            .reduce(initial) { acc, value in
                var (wip, result) = acc
                
                wip.append(value)

                if wip.count == size {
                    result.append(wip)
                    wip.removeAll()
                }

                return (wip, result)
            }
        
        if wip.isEmpty {
            return result
        }
        result.append(wip)
        return result
    }
    
    func duplicateElement(at index: Int) -> [Element] {
        var mutable = self
        let contents = self[index]
        mutable.insert(contents, at: index.advanced(by: 1))
        return mutable
    }
    

}

extension Array where Element: CustomStringConvertible {
    
    func prettify(joiner: String = "") -> String {
        guard let first = first else {
            return ""
        }
        return self[1...].reduce(into: "\(first.description)") { acc, next in
            acc.append(joiner)
            acc.append(next.description)
        }
    }
}

extension Array where Element: Collection {
    
    func flatten() -> [Element.Element] {
        return reduce([], +)
    }

}

extension Sequence where Element == Int {
    
    func sum() -> Int {
        return self.reduce(0, +)
    }
    
    func product() -> Int {
        return self.reduce(1, *)
    }
}

extension Array where Element == Int {
    
    func areAllTheSame() -> Bool {
        guard let first = first else {
            return true
        }
        return allSatisfy { $0 == first }
    }
    
    func stepDifferences() -> [Int] {
        guard let first = first else {
            return []
        }
        return self[1...].reduce(([], first)) { acc, next in
            var (steps, previous) = acc
            steps.append(next - previous)
            return (steps, next)
        }.0
        
    }
}

extension Array where Element == String {
    func rotate() -> Self {
        guard let first = first else {
            return []
        }
        let output = Array(repeating: "", count: first.count)
        return self.reduce(into: output) { acc, next in
            next.enumerated().forEach { (index, value) in
                acc[index].append(value)
            }
        }
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
    
    func groupBy(_ fn: (Element) -> Bool) -> [[Element]] {
        return groupBy(fn, transform: { x in x })
    }
    
    func groupBy<T>(_ fn: (Element) -> Bool, transform: (Element) -> T) -> [[T]] {
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

extension Collection {
    func parallelMap<T>(
        parallelism requestedParallelism: Int? = nil,
        _ transform: @escaping (Element) async throws -> T
    ) async rethrows -> [T] {
        let defaultParallelism = 2
        let parallelism = requestedParallelism ?? defaultParallelism

        let n = count
        if n == 0 {
            return []
        }
        return try await withThrowingTaskGroup(of: (Int, T).self, returning: [T].self) { group in
            var result = [T?](repeatElement(nil, count: n))

            var i = self.startIndex
            var submitted = 0

            func submitNext() async throws {
                if i == self.endIndex { return }

                group.addTask { [submitted, i] in
                    let value = try await transform(self[i])
                    return (submitted, value)
                }
                submitted += 1
                formIndex(after: &i)
            }

            // submit first initial tasks
            for _ in 0 ..< parallelism {
                try await submitNext()
            }

            // as each task completes, submit a new task until we run out of work
            while let (index, taskResult) = try await group.next() {
                result[index] = taskResult

                try Task.checkCancellation()
                try await submitNext()
            }

            assert(result.count == n)
            return Array(result.compactMap { $0 })
        }
    }

    func parallelEach(
        parallelism requestedParallelism: Int? = nil,
        _ work: @escaping (Element) async throws -> Void
    ) async rethrows {
        _ = try await parallelMap {
            try await work($0)
        }
    }
}
