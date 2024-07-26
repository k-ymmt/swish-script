import SwiftSyntaxMacros
import SwiftSyntax
import SwiftSyntaxBuilder

enum MergeMacro: DeclarationMacro {
    static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        (3..<10).map(makeAmbDeclaration(number:))
    }
}

private func makeAmbDeclaration(number: Int) -> DeclSyntax {
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
            "Parser\(number).O?"
        }
        func call(number: Int) -> String {
            """
            if let result = try? parser\(number).parse(input) {
                return .init(data: (\(array.map { $0 == number ? "result.data" : "nil" }.joined(separator: ", "))), rest: result.rest)
            }
            """
        }
        return """
        public func parse(_ input: Substring) throws(ParseError) -> ParseOutput<(\(raw: array.map(returnType(number:)).joined(separator: ", ")))> {
            \(raw: array.map(call(number:)).joined(separator: "\n"))

            throw ParseError(message: "Don't match parser")
        }
        """
    }

    return """
    public struct Merge\(raw: number - 1)<\(raw: generics)>: Parsable {
        \(variables)
        \(initializer)
        \(parse)
    }
    """
}
