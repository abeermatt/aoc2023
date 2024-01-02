import Foundation

extension Day15 {
    
    struct Algorithm {
        static func hash(_ value: any StringProtocol) -> UInt8 {
            let hash = value.reduce(0) { acc, next in
                let code = next.asciiValue!
                var currentValue = acc + Int(code)
                currentValue *= 17
                return currentValue % 256
            }
            
            return UInt8(hash)
        }
    }
}
