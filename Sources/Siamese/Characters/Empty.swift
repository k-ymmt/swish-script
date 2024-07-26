
public struct Empty: Parsable {
    public init() {
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Void> {
        guard input.isEmpty else {
            throw ParseError(message: "input is required empty, but \(input)")
        }

        return .init(data: (), rest: input.dropFirst())
    }
}
