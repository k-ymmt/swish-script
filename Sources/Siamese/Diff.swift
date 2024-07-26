public struct Diff<Parser: Parsable, FailParser: Parsable>: Parsable {
    let parser: Parser
    let failParser: FailParser

    public init(_ parser: Parser, to failParser: FailParser) {
        self.parser = parser
        self.failParser = failParser
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Parser.O> {
        let result = try Concat2(Not(failParser), parser).parse(input)
        return .init(data: result.data.1, rest: result.rest)
    }
}
