public struct NonZeroDigit: Parsable {
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Int8> {
        let result = try Digit().parse(input)
        guard result.data != 0 else {
            throw ParseError(message: "not expected 0")
        }

        return result
    }
}
