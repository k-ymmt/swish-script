public struct BooleanLiteral: Parsable {
    public init() {
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Bool> {
        try Amb(Map(Str("true")) { _ in true }, Map(Str("false")) { _ in false }).parse(input)
    }
}
