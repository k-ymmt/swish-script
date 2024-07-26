public struct Merge<O>: Parsable {
    let parsers: [any Parsable<O>]

    public init(_ parsers: [any Parsable<O>]) {
        self.parsers = parsers
    }

    public init(_ parsers: any Parsable<O>...) {
        self.parsers = parsers
    }

    public init(@Builder _ builder: () -> [any Parsable<O>]) {
        self.parsers = builder()
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<[O]> {
        var results: [O] = []
        var current = input
        for parser in parsers {
            let result = try parser.parse(current)
            results.append(result.data)
            current = result.rest
        }
        return .init(data: results, rest: current)
    }
}

public extension Merge {
    @resultBuilder
    enum Builder {
        public static func buildBlock(_ components: any Parsable<O>...) -> [any Parsable<O>] {
            components
        }
    }
}
