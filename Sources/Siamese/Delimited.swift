/// Matches an object from the first parser and discards it, then gets an object from the second parser, and finally matches an object from the third parser and discards it.
public struct Delimited<First: Parsable, Second: Parsable, Third: Parsable>: Parsable {
    let first: First
    let second: Second
    let third: Third

    public init(_ first: First, _ second: Second, _ third: Third) {
        self.first = first
        self.second = second
        self.third = third
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Second.O> {
        let firstResult = try first.parse(input)
        let secondResult = try second.parse(firstResult.rest)
        let thirdResult = try third.parse(secondResult.rest)

        return .init(data: secondResult.data, rest: thirdResult.rest)
    }
}
