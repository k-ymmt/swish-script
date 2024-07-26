public struct Char: Parsable {
    let character: Character

    public init(_ character: Character) {
        self.character = character
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Character> {
        let result = try AnyChar().parse(input)
        guard result.data == character else {
            throw ParseError(message: "expected character is \(character), but \(result.data)")
        }

        return result
    }
}

