// fold_many0 -> Reduce
public struct Reduce<Parser: Parsable, Result>: Parsable {
    let initialValue: Result
    let parser: Parser
    let nextPartialResult: (Result, Parser.O) throws -> Result

    public init(initialValue: Result, parser: Parser, _ nextPartialResult: @escaping (Result, Parser.O) throws -> Result) {
        self.initialValue = initialValue
        self.parser = parser
        self.nextPartialResult = nextPartialResult
    }

    public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Result> {
        var partialResult: Result = initialValue
        var current = input
        while let parsed = try? parser.parse(current), let result = try? nextPartialResult(partialResult, parsed.data) {
            partialResult = result
            current = parsed.rest
        }

        return .init(data: partialResult, rest: current)
    }
}
