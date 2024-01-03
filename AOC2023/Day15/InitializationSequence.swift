import Foundation

extension Day15 {
    
    struct InitializationSequence {
        
        typealias Lens = (String, Int)
        
        var boxes: [Int: [Lens]] = (0..<256).reduce(into: [:], {acc, id in
            acc[id] = []
        })
        var labels: Set<String> = []
        
        func focussingPower(of label: String) -> Int {
            let id = Int(Algorithm.hash(label))
            let lenses = boxes[id]!.enumerated()
            
            if let match = lenses.first(where: { (index, value) in label == value.0 }) {
                let (offset, (_, length)) = match
                return (Int(id) + 1) * (offset + 1) * length
            }

            return 0
        }
        
        
        func totalFocussingPower() -> Int {
            return labels
                .map(focussingPower(of:))
                .sum()
        }
        
        mutating func apply(operation: Day15.Operation) {
            switch operation {
            case .dash(let label): removeLens(withLabel: label)
            case .equals(let label, let length): putLens(withLabel: label, andFocalLength: length)
            }
            
        }
        
        private mutating func removeLens(withLabel label: String) {
            let id = Int(Algorithm.hash(label))
            var lenses = boxes[id]!
            lenses.removeAll(where: { (lensLabel, _) in label == lensLabel })
            boxes.updateValue(lenses, forKey: id)
            labels.remove(label)
        }
        
        private mutating func putLens(withLabel label: String, andFocalLength length: Int) {
            let id = Int(Algorithm.hash(label))
            var lenses = boxes[id]!
            if let index = lenses.firstIndex(where: { (lensLabel, _) in label == lensLabel }) {
                lenses[index] = (label, length)
            } else {
                lenses.append((label, length))
            }
            boxes.updateValue(lenses, forKey: id)
            labels.insert(label)
        }
        
        static func parse(_ input: String) -> Self {
            return input
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .split(separator: ",")
                .reduce(into: InitializationSequence()) { sequence, step in
                    let operation = Operation.parse(step)
                    sequence.apply(operation: operation)
                }
        }
                
        
    }
}

extension Day15.InitializationSequence: CustomStringConvertible {
    
    var description: String {
        let keys = boxes.keys.sorted()
        
        return keys
            .compactMap { key in
                
                let lenses = boxes[key]!
                if lenses.isEmpty {
                    return nil
                }
                let lensesDescription = lenses
                    .map { (label, length) in
                        return "[\(label) \(length)]"
                    }
                    .joined(separator: " ")
                return "Box \(key): \(lensesDescription)"
            }
            .joined(separator: "\n")
    }
}
