import Siamese

indirect enum Expression {
    case identifier(String)
    case numberLiteral(Float)
    case functionInvoke(String, [Expression])
    case add(Expression, Expression)
    case sub(Expression, Expression)
    case mul(Expression, Expression)
    case div(Expression, Expression)
}

enum Statement {
    case expression(Expression)
    case variableDefinition(String, Expression)
}

func eval(_ expression: Expression) -> Float {
    switch expression {
    case .identifier(let identifier):
        if identifier == "pi" {
            .pi
        } else {
            fatalError("unknown name: \(identifier)")
        }
    case .numberLiteral(let value):
        value
    case let .add(lhs, rhs):
        eval(lhs) + eval(rhs)
    }
}

func spaceDelimited<T>(_ parser: some Parsable<T>) -> some Parsable<T> {
    Delimited(Whitespace(), parser, Whitespace())
}

nonisolated var factor: some Parsable<Expression> {
    Amb4(number, <#T##parser2: Parsable##Parsable#>, <#T##parser3: Parsable##Parsable#>, <#T##parser4: Parsable##Parsable#>)
}

nonisolated var term: some Parsable<Expression> {
    Amb(number, identifier, parens())
}

nonisolated var number: some Parsable<Expression> {
    Map(Delimited(Whitespace(), Number(), Whitespace())) { number in
            .numberLiteral(Float(number))
    }
}

nonisolated var identifier: some Parsable<Expression> {
    Map(Delimited(Whitespace(), identifierString, Whitespace())) { identifier in
        .identifier(identifier)
    }
}

nonisolated var identifierString: some Parsable<String> {
    Map(Concat2(Amb(Alphabet(), Char("_")), Repeat(Amb(Alphabet(), Char("_"))))) { first, rest in
        String(first) + String(rest)
    }
}

func parens() -> some Parsable<Expression> {
    Delimited(
        Whitespace(),
        Delimited(Char("("), expression, Char(")")),
        Whitespace()
    )
}

nonisolated var expression: some Parsable<Expression> {
    Map(
        Concat2(
            term,
            Repeat(
                Concat2(
                    Delimited(Whitespace(), Char("+"), Whitespace()),
                    term
                )
            )
        )
    ) { (lhs, rhsAndPlus) in
        rhsAndPlus.reduce(lhs) { (lhs, rhsAndPlus) in
            let (_, rhs) = rhsAndPlus
            return .add(lhs, rhs)
        }
    }
}

struct Term: Parsable {
    func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Expression> {
        let result = try factor.parse(input)

        return try Reduce(
            initialValue: result.data,
            parser: Concat2(spaceDelimited(Or2(Char("*"), Char("/"))), factor)
        ) { acc, output in
            let (char, expression) = output
            return switch char {
            case "*":
                .mul(acc, expression)
            case "/":
                .div(acc, expression)
            default:
                fatalError("expression should have '*' or '/' operator")
            }
        }.parse(result.rest)
    }
}

struct Expr: Parsable {
    func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Expression> {
        let result = try Term().parse(input)

        return try Reduce(
            initialValue: result.data,
            parser: Concat2(spaceDelimited(Or2(Char("+"), Char("-"))), Term())
        ) { acc, output in
            let (char, expression) = output
            return switch char {
            case "+":
                .add(acc, expression)
            case "-":
                .sub(acc, expression)
            default:
                fatalError("expression should have '+' or '-' operator")
            }
        }.parse(result.rest)
    }
}

struct FuncCall: Parsable {
    func parse(_ input: Substring) throws(ParseError) -> ParseOutput<Expression> {
        let result1 = try spaceDelimited(identifierString).parse(input)
        let result2 = try spaceDelimited(Delimited(
            Char("("),
            Repeat(Delimited(
                Whitespace(),
                Expr(),
                spaceDelimited(Option(Char(",")))
            )),
            Char(")")
        )).parse(result1.rest)
        return .init(data: .functionInvoke(result1.data, result2.data), rest: result2.rest)
    }
}
