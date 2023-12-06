//
//  Day6.swift
//  AOC2023
//
//  Created by Matthew Hobbs on 06/12/2023.
//

import Foundation
struct Day6 {
    struct Part1 {
        static func maximumDistance(forRaceLasting duration: Int, withButtonDownTimeOf buttonTime: Int) -> Int {
            let travelTime = duration - buttonTime
            return buttonTime * travelTime
        }
        
        static func waysOfBeating(raceRecord record: Int, forRaceLasting duration: Int) -> Int {
            return  (0..<duration).map { buttonDownTime in
                return maximumDistance(forRaceLasting: duration, withButtonDownTimeOf: buttonDownTime)
            }.filter { $0 > record }
                .count
        }
        
        static func marginOfError(forInput input: String) -> Int {
            let lines = input.components(separatedBy: .newlines).reject(\.isEmpty)
            let times = lines[0].takePrefix("Time:").trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces).reject(\.isEmpty)
            let distances = lines[1].takePrefix("Distance:").trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces).reject(\.isEmpty)
            
            print("times \(times)")
            print("distances \(distances)")
            
            return zip(times, distances)
                .compactMap { pair in
                    print(pair)
                    if pair == ("" ,"") {
                        return nil
                    }
                    let time = Int(pair.0)!
                    let distance = Int(pair.1)!
                    return waysOfBeating(raceRecord: distance, forRaceLasting: time)
                }
                .product()
        }
    }
}
