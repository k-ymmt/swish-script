
@freestanding(declaration, names: prefixed(Concat))
macro Concat() = #externalMacro(module: "SiameseMacros", type: "ConcatMacro")

// pair -> Concat2

public struct Concat2<Parser1: Parsable, Parser2: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    public init(_ parser1: Parser1, _ parser2: Parser2) {
        self.parser1 = parser1
        self.parser2 = parser2
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O, Parser2.O)> {
        let result1 = try parser1.parse(input)
        let result2 = try parser2.parse(result1.rest)

        return .init(data: (result1.data, result2.data), rest: result2.rest)
    }
}
public struct Concat3<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable>: Parsable {
    let parser1: Parser1
    let parser2: Parser2
    let parser3: Parser3
    public init(_ parser1: Parser1, _ parser2: Parser2, _ parser3: Parser3) {
        self.parser1 = parser1
        self.parser2 = parser2
        self.parser3 = parser3
    }
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O, Parser2.O, Parser3.O)> {
        let result1 = try parser1.parse(input)
        let result2 = try parser2.parse(result1.rest)
        let result3 = try parser3.parse(result2.rest)

        return .init(data: (result1.data, result2.data, result3.data), rest: result3.rest)
    }
}
public struct Concat4<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable>: Parsable {
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
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O, Parser2.O, Parser3.O, Parser4.O)> {
        let result1 = try parser1.parse(input)
        let result2 = try parser2.parse(result1.rest)
        let result3 = try parser3.parse(result2.rest)
        let result4 = try parser4.parse(result3.rest)

        return .init(data: (result1.data, result2.data, result3.data, result4.data), rest: result4.rest)
    }
}
public struct Concat5<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable, Parser5: Parsable>: Parsable {
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
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O, Parser2.O, Parser3.O, Parser4.O, Parser5.O)> {
        let result1 = try parser1.parse(input)
        let result2 = try parser2.parse(result1.rest)
        let result3 = try parser3.parse(result2.rest)
        let result4 = try parser4.parse(result3.rest)
        let result5 = try parser5.parse(result4.rest)

        return .init(data: (result1.data, result2.data, result3.data, result4.data, result5.data), rest: result5.rest)
    }
}
public struct Concat6<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable, Parser5: Parsable, Parser6: Parsable>: Parsable {
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
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O, Parser2.O, Parser3.O, Parser4.O, Parser5.O, Parser6.O)> {
        let result1 = try parser1.parse(input)
        let result2 = try parser2.parse(result1.rest)
        let result3 = try parser3.parse(result2.rest)
        let result4 = try parser4.parse(result3.rest)
        let result5 = try parser5.parse(result4.rest)
        let result6 = try parser6.parse(result5.rest)

        return .init(data: (result1.data, result2.data, result3.data, result4.data, result5.data, result6.data), rest: result6.rest)
    }
}
public struct Concat7<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable, Parser5: Parsable, Parser6: Parsable, Parser7: Parsable>: Parsable {
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
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O, Parser2.O, Parser3.O, Parser4.O, Parser5.O, Parser6.O, Parser7.O)> {
        let result1 = try parser1.parse(input)
        let result2 = try parser2.parse(result1.rest)
        let result3 = try parser3.parse(result2.rest)
        let result4 = try parser4.parse(result3.rest)
        let result5 = try parser5.parse(result4.rest)
        let result6 = try parser6.parse(result5.rest)
        let result7 = try parser7.parse(result6.rest)

        return .init(data: (result1.data, result2.data, result3.data, result4.data, result5.data, result6.data, result7.data), rest: result7.rest)
    }
}
public struct Concat8<Parser1: Parsable, Parser2: Parsable, Parser3: Parsable, Parser4: Parsable, Parser5: Parsable, Parser6: Parsable, Parser7: Parsable, Parser8: Parsable>: Parsable {
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
    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(Parser1.O, Parser2.O, Parser3.O, Parser4.O, Parser5.O, Parser6.O, Parser7.O, Parser8.O)> {
        let result1 = try parser1.parse(input)
        let result2 = try parser2.parse(result1.rest)
        let result3 = try parser3.parse(result2.rest)
        let result4 = try parser4.parse(result3.rest)
        let result5 = try parser5.parse(result4.rest)
        let result6 = try parser6.parse(result5.rest)
        let result7 = try parser7.parse(result6.rest)
        let result8 = try parser8.parse(result7.rest)

        return .init(data: (result1.data, result2.data, result3.data, result4.data, result5.data, result6.data, result7.data, result8.data), rest: result8.rest)
    }
}
