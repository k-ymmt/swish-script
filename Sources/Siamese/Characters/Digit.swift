
public struct Digit: Parsable {
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Int8> {
        let digit = try AnyChar().parse(input)
        guard let int = Int8(String(digit.data)) else {
            throw ParseError(message: "\(digit.data) is not digit.")
        }

        return .init(data: int, rest: digit.rest)
    }
}
