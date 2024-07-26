
public struct Repeat<O, Parser: Parsable<O>>: Parsable {
    public let min: Int
    public let max: Int
    public let parser: Parser

    public init(_ parser: Parser, min: Int = 0, max: Int = .max) {
        self.min = min
        self.max = max
        self.parser = parser
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<[O]> {
        guard min <= max else {
            throw ParseError(message: "min(\(min)) > max(\(max)) is not allowed.")
        }
        guard min >= 0 else {
            throw ParseError(message: "required min(\(min)) > 0")
        }
        guard max > 0 else {
            throw ParseError(message: "required max(\(max)) > 0")
        }

        var results: [O] = []
        var current = input
        do {
            for _ in 0..<max {
                let result = try parser.parse(current)
                results.append(result.data)
                current = result.rest
            }
        } catch {
        }
        guard results.count >= min else {
            throw ParseError(message: "Did not reach the required minimum of \(min) times. actual times: \(results.count)")
        }

        return .init(data: results, rest: current)
    }
}
