public struct ParseError: Error {
    public let message: String
}

public struct ParseOutput<O> {
    public let data: O
    public let rest: Substring

    public init(data: O, rest: Substring) {
        self.data = data
        self.rest = rest
    }
}

public extension ParseOutput where O == Void {
    init(rest: Substring) {
        self.init(data: (), rest: rest)
    }
}
