import Combine

extension Published: Encodable where Value: Encodable {

    private var valueChild: Value? {
            let mirror = Mirror(reflecting: self)
            if let valueChild = mirror.descendant("value") as? Value {
                return valueChild
            }

            // iOS 14 does things differently...
            if let valueChild = mirror.descendant("storage", "value") as? Value {
                return valueChild
            }

            // iOS 14 does this too...
            if let valueChild = mirror.descendant("storage", "publisher", "subject", "currentValue") as? Value {
                return valueChild
            }

            return nil
        }

    public func encode(to encoder: Encoder) throws {
        guard let valueChild = valueChild else {
            fatalError("Could not read Value")
        }
        try valueChild.encode(to: encoder)
    }
}

extension Published: Decodable where Value: Decodable {
    public init(from decoder: Decoder) throws {
        let value = try Value.init(from: decoder)
        self.init(initialValue: value)
    }
}
