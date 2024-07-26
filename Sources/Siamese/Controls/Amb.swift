
// alt -> Amb
public struct Amb<O>: Parsable {
    let parsers: [any Parsable<O>]

    public init(_ parsers: [any Parsable<O>]) {
        self.parsers = parsers
    }

    public init(_ parsers: (any Parsable<O>)...) {
        self.parsers = parsers
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<O> {
        for parser in parsers {
            guard let result = try? parser.parse(input) else {
                continue
            }

            return result
        }

        throw ParseError(message: "Don't match parsers")
    }
}

@freestanding(declaration, names: prefixed(Amb))
macro Amb() = #externalMacro(module: "SiameseMacros", type: "AmbMacro")

public struct Amb2<Parser1: Parsable, Parser2: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    public init(_ parser1: Parser1, _ parser2: Parser2) {
        self.parser1 = parser1
        self.parser2 = parser2
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O?, Parser2.O?)> {
        if let result = try? parser1.parse(input) {
            return .init(data: (result.data, nil), rest: result.rest)
        }
        if let result = try? parser2.parse(input) {
            return .init(data: (nil, result.data), rest: result.rest)
        }

        throw ParseError(message: "Don't match parser")
    }
}
public struct Amb3<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    let parser3: Parser3
    public init(_ parser1: Parser1, _ parser2: Parser2, _ parser3: Parser3) {
        self.parser1 = parser1
        self.parser2 = parser2
        self.parser3 = parser3
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O?, Parser2.O?, Parser3.O?)> {
        if let result = try? parser1.parse(input) {
            return .init(data: (result.data, nil, nil), rest: result.rest)
        }
        if let result = try? parser2.parse(input) {
            return .init(data: (nil, result.data, nil), rest: result.rest)
        }
        if let result = try? parser3.parse(input) {
            return .init(data: (nil, nil, result.data), rest: result.rest)
        }

        throw ParseError(message: "Don't match parser")
    }
}
public struct Amb4<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    let parser3: Parser3
    let parser4: Parser4
    public init(_ parser1: Parser1, _ parser2: Parser2, _ parser3: Parser3, _ parser4: Parser4) {
        self.parser1 = parser1
        self.parser2 = parser2
        self.parser3 = parser3
        self.parser4 = parser4
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O?, Parser2.O?, Parser3.O?, Parser4.O?)> {
        if let result = try? parser1.parse(input) {
            return .init(data: (result.data, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser2.parse(input) {
            return .init(data: (nil, result.data, nil, nil), rest: result.rest)
        }
        if let result = try? parser3.parse(input) {
            return .init(data: (nil, nil, result.data, nil), rest: result.rest)
        }
        if let result = try? parser4.parse(input) {
            return .init(data: (nil, nil, nil, result.data), rest: result.rest)
        }

        throw ParseError(message: "Don't match parser")
    }
}
public struct Amb5<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable, Parser5: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    let parser3: Parser3
    let parser4: Parser4
    let parser5: Parser5
    public init(_ parser1: Parser1, _ parser2: Parser2, _ parser3: Parser3, _ parser4: Parser4, _ parser5: Parser5) {
        self.parser1 = parser1
        self.parser2 = parser2
        self.parser3 = parser3
        self.parser4 = parser4
        self.parser5 = parser5
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O?, Parser2.O?, Parser3.O?, Parser4.O?, Parser5.O?)> {
        if let result = try? parser1.parse(input) {
            return .init(data: (result.data, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser2.parse(input) {
            return .init(data: (nil, result.data, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser3.parse(input) {
            return .init(data: (nil, nil, result.data, nil, nil), rest: result.rest)
        }
        if let result = try? parser4.parse(input) {
            return .init(data: (nil, nil, nil, result.data, nil), rest: result.rest)
        }
        if let result = try? parser5.parse(input) {
            return .init(data: (nil, nil, nil, nil, result.data), rest: result.rest)
        }

        throw ParseError(message: "Don't match parser")
    }
}
public struct Amb6<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable, Parser5: Parsable, Parser6: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    let parser3: Parser3
    let parser4: Parser4
    let parser5: Parser5
    let parser6: Parser6
    public init(_ parser1: Parser1, _ parser2: Parser2, _ parser3: Parser3, _ parser4: Parser4, _ parser5: Parser5, _ parser6: Parser6) {
        self.parser1 = parser1
        self.parser2 = parser2
        self.parser3 = parser3
        self.parser4 = parser4
        self.parser5 = parser5
        self.parser6 = parser6
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O?, Parser2.O?, Parser3.O?, Parser4.O?, Parser5.O?, Parser6.O?)> {
        if let result = try? parser1.parse(input) {
            return .init(data: (result.data, nil, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser2.parse(input) {
            return .init(data: (nil, result.data, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser3.parse(input) {
            return .init(data: (nil, nil, result.data, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser4.parse(input) {
            return .init(data: (nil, nil, nil, result.data, nil, nil), rest: result.rest)
        }
        if let result = try? parser5.parse(input) {
            return .init(data: (nil, nil, nil, nil, result.data, nil), rest: result.rest)
        }
        if let result = try? parser6.parse(input) {
            return .init(data: (nil, nil, nil, nil, nil, result.data), rest: result.rest)
        }

        throw ParseError(message: "Don't match parser")
    }
}
public struct Amb7<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable, Parser5: Parsable, Parser6: Parsable, Parser7: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    let parser3: Parser3
    let parser4: Parser4
    let parser5: Parser5
    let parser6: Parser6
    let parser7: Parser7
    public init(_ parser1: Parser1, _ parser2: Parser2, _ parser3: Parser3, _ parser4: Parser4, _ parser5: Parser5, _ parser6: Parser6, _ parser7: Parser7) {
        self.parser1 = parser1
        self.parser2 = parser2
        self.parser3 = parser3
        self.parser4 = parser4
        self.parser5 = parser5
        self.parser6 = parser6
        self.parser7 = parser7
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O?, Parser2.O?, Parser3.O?, Parser4.O?, Parser5.O?, Parser6.O?, Parser7.O?)> {
        if let result = try? parser1.parse(input) {
            return .init(data: (result.data, nil, nil, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser2.parse(input) {
            return .init(data: (nil, result.data, nil, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser3.parse(input) {
            return .init(data: (nil, nil, result.data, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser4.parse(input) {
            return .init(data: (nil, nil, nil, result.data, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser5.parse(input) {
            return .init(data: (nil, nil, nil, nil, result.data, nil, nil), rest: result.rest)
        }
        if let result = try? parser6.parse(input) {
            return .init(data: (nil, nil, nil, nil, nil, result.data, nil), rest: result.rest)
        }
        if let result = try? parser7.parse(input) {
            return .init(data: (nil, nil, nil, nil, nil, nil, result.data), rest: result.rest)
        }

        throw ParseError(message: "Don't match parser")
    }
}
public struct Amb8<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable, Parser5: Parsable, Parser6: Parsable, Parser7: Parsable, Parser8: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    let parser3: Parser3
    let parser4: Parser4
    let parser5: Parser5
    let parser6: Parser6
    let parser7: Parser7
    let parser8: Parser8
    public init(_ parser1: Parser1, _ parser2: Parser2, _ parser3: Parser3, _ parser4: Parser4, _ parser5: Parser5, _ parser6: Parser6, _ parser7: Parser7, _ parser8: Parser8) {
        self.parser1 = parser1
        self.parser2 = parser2
        self.parser3 = parser3
        self.parser4 = parser4
        self.parser5 = parser5
        self.parser6 = parser6
        self.parser7 = parser7
        self.parser8 = parser8
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O?, Parser2.O?, Parser3.O?, Parser4.O?, Parser5.O?, Parser6.O?, Parser7.O?, Parser8.O?)> {
        if let result = try? parser1.parse(input) {
            return .init(data: (result.data, nil, nil, nil, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser2.parse(input) {
            return .init(data: (nil, result.data, nil, nil, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser3.parse(input) {
            return .init(data: (nil, nil, result.data, nil, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser4.parse(input) {
            return .init(data: (nil, nil, nil, result.data, nil, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser5.parse(input) {
            return .init(data: (nil, nil, nil, nil, result.data, nil, nil, nil), rest: result.rest)
        }
        if let result = try? parser6.parse(input) {
            return .init(data: (nil, nil, nil, nil, nil, result.data, nil, nil), rest: result.rest)
        }
        if let result = try? parser7.parse(input) {
            return .init(data: (nil, nil, nil, nil, nil, nil, result.data, nil), rest: result.rest)
        }
        if let result = try? parser8.parse(input) {
            return .init(data: (nil, nil, nil, nil, nil, nil, nil, result.data), rest: result.rest)
        }

        throw ParseError(message: "Don't match parser")
    }
}

