
public struct List<Parser: Parsable, Delimiter: Parsable>: Parsable {
    let parser: Parser
    let delimiter: Delimiter

    public init(_ parser: Parser, delimiter: Delimiter) {
        self.parser = parser
        self.delimiter = delimiter
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<[Parser.O]> {
        let result = try Concat2(parser, Repeat(Concat2(delimiter, parser))).parse(input)
        return .init(data: CollectionOfOne(result.data.0) + result.data.1.map(\.1), rest: result.rest)
    }
}
