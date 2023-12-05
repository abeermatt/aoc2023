import Foundation

extension Day5 {
    
    struct Almanac {
        
        let seedToSoil: MMap
        let soilToFertilizer: MMap
        let fertilizerToWater: MMap
        let waterToLight: MMap
        let lightToTemperature: MMap
        let temperatureToHumidity: MMap
        let humidityToLocation: MMap
        
        func getSoil(forSeed seed: Int) -> Int {
            return seedToSoil.getDestination(forSource: seed)
        }
        
        func getFertilizer(forSoil soil: Int) -> Int {
            return soilToFertilizer.getDestination(forSource: soil)
        }

        func getWater(forFertilizer fertilizer: Int) -> Int {
            return fertilizerToWater.getDestination(forSource: fertilizer)
        }

        func getLight(forWater water: Int) -> Int {
            return waterToLight.getDestination(forSource: water)
        }

        func getTemperature(forLight light: Int) -> Int {
            return lightToTemperature.getDestination(forSource: light)
        }

        func getHumidity(forTemperature temperature: Int) -> Int {
            return temperatureToHumidity.getDestination(forSource: temperature)
        }
        
        func getLocation(forHumidity humidity: Int) -> Int {
            return humidityToLocation.getDestination(forSource: humidity)
        }
        
        func getLocation(forSeed seed: Int) -> Int {
            return getLocation(forHumidity: getHumidity(forTemperature: getTemperature(forLight: getLight(forWater: getWater(forFertilizer: getFertilizer(forSoil: getSoil(forSeed: seed)))))))
        }
        
        static func fromInput(_ input: String) -> Self {
            return fromArray(input.components(separatedBy: .newlines))
        }
        
        static func fromArray(_ input: Array<String>) -> Self {
            let maps = input
                .split(whereSeparator: \.isEmpty)
            .map { group in
                let map = group.dropFirst()
                return MMap.fromArray(Array(map))
            }
            
        return Almanac(
            seedToSoil: maps[0],
            soilToFertilizer: maps[1],
            fertilizerToWater: maps[2],
            waterToLight: maps[3],
            lightToTemperature: maps[4],
            temperatureToHumidity: maps[5],
            humidityToLocation: maps[6])

        }
        
    }
}
