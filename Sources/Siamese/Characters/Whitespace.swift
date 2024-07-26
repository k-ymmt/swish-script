public struct Whitespace: Parsable {
    public init() {
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Void> {
        guard !input.isEmpty else {
            return .init(rest: input)
        }
        var whitespaceCount = 0
        for char in input {
            guard char == " " || char == "\t" else {
                break
            }
            whitespaceCount += 1
        }

        return .init(rest: input.dropFirst(whitespaceCount))
    }
}
