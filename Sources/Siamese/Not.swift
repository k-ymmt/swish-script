public struct Not<O, Parser: Parsable<O>>: Parsable {
    let parser: Parser

    public init(_ parser: Parser) {
        self.parser = parser
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Void> {
        do {
            _ = try parser.parse(input)
        } catch {
            return .init(data: (), rest: input)
        }
        throw ParseError(message: "require to fail to parse.")
    }
}
