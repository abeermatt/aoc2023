import Foundation

struct Day5 {
    
    struct Part1 {

        static func lowestLocation(_ input: String) -> Int {
            let lines = input .components(separatedBy: .newlines)
            let seeds = lines[0]
                .takePrefix("seeds: ")
                .components(separatedBy: " ")
                .map { Int($0)! }
            var almanac = Day5.Almanac.fromArray(Array(lines[2...]))
            
//            return seeds.map(almanac.getLocation(forSeed:)).min()!
            
            return 0
        }
        
    }
    
    struct Part2 {
        
        static func lowestLocation(_ input: String) async -> Int {
            let lines = input .components(separatedBy: .newlines)
            let almanac = Day5.Almanac.fromArray(Array(lines[2...]))

            let pairs = lines[0]
                .takePrefix("seeds: ")
                .components(separatedBy: " ")
                .chunk(every: 2)
            
            return await pairs.parallelMap(parallelism: 4) { pair in
                    print("processing pair \(pair)")
                    let start = Int(pair[0])!
                    let length = Int(pair[1])!
                    let end = start + length
                    let range = start..<end
                    return await minimum(forRange: range, almanac: almanac)
                }
                .min()!

        }
    
        static func minimum(forRange range: Range<Int>, almanac: Almanac) async -> Int {
            return range.reduce(Int.max) { m, seed in
                let location = almanac.getLocation(forSeed: seed)
                return min(m, location)
            }
        }
                        
    }
}
