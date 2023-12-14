import Foundation
import Algorithms

extension Day12 {
        
    struct Row {
        
        static let unknown = /\?+/
        static let springs = Spring.allCases
        
        let line: String
        let groups: [Int]
        
        func unfolded() -> Self {
            return self
        }
     
        func arrangements() -> Int {

            let matches = line.matches(of: Self.unknown)
            let regexStr = groups
                .map { count in "\\#{\(count)}" }
                .joined(separator: "\\.+")
            
            let regex = try! Regex("^\\.*\(regexStr)\\.*$")

            let perms: [Range<String.Index>: [String]] = matches.reduce(into: [:]) { acc, match in
                let range = match.range
                
                let size = line.distance(from: range.lowerBound, to: range.upperBound)
                acc[range] =  Self.springs
                    .cycled(times: size)
                    .uniquePermutations(ofCount: size)
                    .map { $0.prettify(joiner: "") }
            }
                                    
            let all = perms.reduce(into: Set<String>([line])) { acc, next in
                let (range, subs) = next
                for value in acc {
                    for sub in subs {
                        acc.insert(value.replacingCharacters(in: range, with: sub))
                    }
                }
            }
            let set = all.filter { $0.contains(regex) }
            
            return set.count
        }
        
        static func parse(_ input: String) -> Self {
            let split = input.components(separatedBy: .whitespaces)
            let groups = split[1].components(separatedBy: CharacterSet(charactersIn: ",")).map { Int.init($0)! }
            return .init(line: split[0], groups: groups)
        }
        
    }
}

