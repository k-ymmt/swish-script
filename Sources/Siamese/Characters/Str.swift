public struct Str: Parsable {
    let string: String

    public init(_ string: String) {
        self.string = string
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Substring> {
        let parser = Merge(string.map(Char.init))
        let result = try parser.parse(input)
        return .init(data: input[input.startIndex..<result.rest.startIndex], rest: result.rest)
    }
}
