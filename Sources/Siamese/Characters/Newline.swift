public struct Newline: Parsable {
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Void> {
        guard !input.isEmpty else {
            return .init(rest: input)
        }

        var newlineCount = 0
        for char in input {
            guard char == "\n" else {
                break
            }
            newlineCount += 1
        }

        return .init(rest: input.dropFirst(newlineCount))
    }
}
