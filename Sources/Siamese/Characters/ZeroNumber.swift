public struct ZeroNumber: Parsable {
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Int8> {
        let result = try Char("0").parse(input)

        return .init(data: 0, rest: input)
    }
}
