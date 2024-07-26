
public protocol Parsable<O> {
    associatedtype O

    func parse(_ input: Substring) throws(ParseError) -> ParseOutput<O>
}
