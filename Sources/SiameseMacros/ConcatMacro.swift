import SwiftSyntaxMacros
import SwiftSyntax
import SwiftSyntaxBuilder

enum ConcatMacro: DeclarationMacro {
    static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        (3..<10).map(makeConcatDeclaration(number:))
    }
}

private func makeConcatDeclaration(number: Int) -> DeclSyntax {
    var array: [Int] {
        Array(1..<number)
    }

    var variables: DeclSyntax {
        func variable(number: Int) -> String {
            """
            let parser\(number): Parser\(number)
            """
        }

        return """
        \(raw: array.map(variable(number:)).joined(separator: "\n"))
        """
    }

    var initializer: DeclSyntax {
        func assign(number: Int) -> String {
            """
            self.parser\(number) = parser\(number)
            """
        }
        return """
        public init(\(raw: array.map { "_ parser\($0): Parser\($0)" }.joined(separator: ", "))) {
            \(raw: array.map(assign(number:)).joined(separator: "\n"))
        }
        """
    }
    var generics: String {
        array.map { "Parser\($0): Parsable" }.joined(separator: ", ")
    }

    var parse: DeclSyntax {
        func returnType(number: Int) -> String {
            "Parser\(number).O"
        }
        func call(number: Int) -> String {
            """
            let result\(number) = try parser\(number).parse(\(number == 1 ? "input" : "result\(number - 1).rest"))
            """
        }
        return """
        public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(\(raw: array.map(returnType(number:)).joined(separator: ", ")))> {
            \(raw: array.map(call(number:)).joined(separator: "\n"))

            return .init(data: (\(raw: array.map { "result\($0).data" }.joined(separator: ", "))), rest: result\(raw: number - 1).rest)
        }
        """
    }

    return """
    public struct Concat\(raw: number - 1)<\(raw: generics)>: Parsable {
        \(variables)
        \(initializer)
        \(parse)
    }
    """
}
