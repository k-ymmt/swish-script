public struct Integer: CombinatorParsable {
    public var body: some Parsable<Int> {
        Map(Concat2(Sign(), Number())) { (sign, number) in
            sign * number
        }
    }
}

public struct Number: CombinatorParsable {
    public init() {
    }

    public var body: some Parsable<Int> {
        Amb([Map(ZeroNumber()) { Int($0) }, NonZeroNumber()])
    }
}

private struct Sign: CombinatorParsable {
    enum Category {
        case positive
        case negative

        static func *(sign: Category,integer: Int) -> Int {
            switch sign {
            case .positive:
                integer
            case .negative:
                -integer
            }
        }
    }
    var body: some Parsable<Category> {
        Map(Option(Amb([Char("+"), Char("-")]))) { output in
            if let output {
                output == "+" ? .positive : .negative
            } else {
                .positive
            }
        }
    }
}

private struct NonZeroNumber: CombinatorParsable {
    var body: some Parsable<Int> {
        Map(Concat2(NonZeroDigit(), Repeat(Digit()))) { result in
            Int("\(result.0)\(result.1.map(String.init).joined())")!
        }
    }
}
