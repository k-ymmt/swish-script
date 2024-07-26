
public struct Option<Parser: Parsable>: Parsable {
    let parser: Parser

    public init(_ parser: Parser) {
        self.parser = parser
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Parser.O?> {
        if let result = try? parser.parse(input) {
            return .init(data: .some(result.data), rest: result.rest)
        } else {
            return .init(data: nil, rest: input)
        }
    }
}
