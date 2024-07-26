public struct Alphabet: Parsable {
    public init() {
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Character> {
        let char = try AnyChar().parse(input)
        guard char.data.isLetter else {
            throw ParseError(message: "\(input.first?.description ?? "(empty)") is not alphabet")
        }

        return .init(data: char.data, rest: char.rest)
    }
}
