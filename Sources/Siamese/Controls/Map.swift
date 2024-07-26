public struct Map<Parser: Parsable, Result>: Parsable {
    let parser: Parser
    let transform: (Parser.O) -> Result

    public init(_ parser: Parser, transform: @escaping (Parser.O) -> Result) {
        self.parser = parser
        self.transform = transform
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Result> {
        let result = try parser.parse(input)

        return .init(data: transform(result.data), rest: result.rest)
    }
}
