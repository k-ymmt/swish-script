public struct AnyChar: Parsable {
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Character> {
        guard let first = input.first else {
            throw .init(message: "expected input to contains some character, but empty")
        }

        return .init(data: first, rest: input.dropFirst())
    }
}
