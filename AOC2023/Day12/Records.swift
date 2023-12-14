import Foundation

extension Day12 {
    struct Records {
        
        let rows: [Row]
        
        static func doIt(_ rows: [String]) async -> Int {
            let lines = Array(rows.enumerated())
            
            return await withTaskGroup(of: (Int, Int).self) { group in
                
                var ids = Set<Int>()
                
                for (index, line) in lines {
                    let lineNumber = index + 1
                    ids.insert(lineNumber)
                    group.addTask {
                        let row = Row.parse(line)
                        let result = row.arrangements()
                        print("Processed row \(lineNumber): \(line) = \(result)")
                        return (lineNumber, result)
                    }
                }
                
                var results: [Int] = []
                for await value in group {
                    ids.remove(value.0)
                    results.append(value.1)
                    print("Got result outstanding \(Array(ids).sorted())")
                }
                return results.sum()
            }
        }
        
//        static func sumArrangements(_ rows: [String]) async -> Int {
//            return await Array(rows
//                .enumerated())
//                .map { next in
//                    let (index, line) = next
//                    
//                    let row = Row.parse(line)
//                    
//                    let result = row.arrangements()
//                    print("Processed row \(index): \(line) = \(result)")
//                    return result
//                }
////                .parallelMap(parallelism: 8) { next in
////                    let (index, line) = next
////                    
////                    let row = Row.parse(line)
////                    
////                    let result = row.arrangements()
////                    print("Processed row \(index): \(line) = \(result)")
////                    return result
////                }
//                .sum()
//        }
        
        static func parse(_ input: String) -> Self {
            let rows = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .map(Row.parse(_:))
            
            return .init(rows: rows)
        }
    }

}
