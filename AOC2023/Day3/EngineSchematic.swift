import Foundation

extension Day3 {
    struct EngineSchematic {
        
        let schemas: [Day3.Schema]
        
        var symbols: [Day3.Symbol] {
            return schemas.compactMap {
                switch $0 {
                case .symbol(let symbol): return symbol
                default: return nil
                }
            }
        }
        
        var partNumbers: [Day3.PartNumber] {
            return schemas.compactMap {
                switch $0 {
                case .partNumber(let partNumber): return partNumber
                default: return nil
                }
            }
        }
        
        func validPartNumbers() -> [Day3.PartNumber] {
            return partNumbers.filter { partNumber in
                return symbols.first { symbol in
                    return partNumber.touching(symbol: symbol)
                } != nil
            }
        }
        
        static func fromInput(_ input: String) -> EngineSchematic {
            let schemas: [Schema] = input
                .components(separatedBy: .newlines)
                .reject(\.isEmpty)
                .enumerated()
                .map(processLine(pair:))
                .reduce([], +)
            
            return EngineSchematic(schemas: schemas)
        }
        
        private static func processLine(pair: (Int, String)) -> [Schema] {
            let (row, line) = pair
            
            let initial: (String, [Schema]) = ("", [])
            let (candidate, schemas) = line
                .enumerated()
                .reduce(initial) { acc, pair in
                    let (candidate, list) = acc
                    let (column, value) = pair

                    var mutable = list
                    
                    if value.isNumber {
                        return ("\(candidate)\(value)", list)
                    }

                    if let number = Int(candidate) {
                        mutable.append(Schema.partNumber(PartNumber(x: column - number.digits(), y: row, value: number)))
                    }
                    if value == "." {
                        return ("", mutable)
                    }
                    mutable.append(Schema.symbol(Symbol(x: column, y: row)))
                    return ("", mutable)
                }
            
            if let number = Int(candidate) {
                var s = schemas
                s.append(Schema.partNumber(PartNumber(x: line.count - number.digits(), y: row, value: number)))
                return s
            }
            return schemas

        }
        
    }

}
