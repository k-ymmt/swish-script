
public struct Is: Parsable {
    let predicate: (Character) -> Bool

    public init(predicate: @escaping (Character) -> Bool) {
        self.predicate = predicate
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Character> {
        let result = try AnyChar().parse(input)
        guard predicate(result.data) else {
            throw .init(message: "unexpected result. input: \(input)")
        }

        return result
    }
}
