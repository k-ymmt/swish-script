public protocol CombinatorParsable<Parser>: Parsable {
    associatedtype Parser: Parsable where Parser.O == O
    var body: Parser { get }
}

public extension CombinatorParsable {
    func parse(_ input: Substring) throws(ParseError) -> ParseOutput<O> {
        try body.parse(input)
    }
}
