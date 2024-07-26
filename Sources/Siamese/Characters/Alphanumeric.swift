public struct Alphanumeric: Parsable {
    public enum Output {
        case alphabet(Character)
        case digit(Int8)
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Output> {
        if let result = try? Alphabet().parse(input) {
            return .init(result)
        }
        if let result = try? Digit().parse(input) {
            return .init(result)
        }

        if let first = input.first {
            throw ParseError(message: "\(first) is not alphabet or digit.")
        } else {
            throw ParseError(message: "input is empty.")
        }
    }
}

private extension ParseOutput where O == Alphanumeric.Output {
    init(_ output: ParseOutput<Character>) {
        self.init(data: .alphabet(output.data), rest: output.rest)
    }

    init(_ output: ParseOutput<Int8>) {
        self.init(data: .digit(output.data), rest: output.rest)
    }
}
