import Testing
@testable import SwishScript

//@Test func example() async throws {
//    #expect(
//        expression(input: "123") == .numberLiteral(123.0)
//    )
//    #expect(
//        expression(input: "Hello + World") == .add(.identifier("Hello"), .identifier("World"))
//    )
//    #expect(
//        expression(input: "(123 + 456) + world") == .add(.add(.numberLiteral(123), .numberLiteral(456)), .identifier("world"))
//    )
//    #expect(
//        expression(input: "(123 + 456) + world") == .add(.add(.numberLiteral(123), .numberLiteral(456)), .identifier("world"))
//    )
//
//    #expect(
//        expression(input: "car + cdr + cdr") == .add(.add(.identifier("car"), .identifier("cdr")), .identifier("cdr"))
//    )
//
//    #expect(
//        expression(input: "((1 + 2) + (3 + 4)) + 5 + 6") == .add(.add(.add(.add(.numberLiteral(1), .numberLiteral(2)), .add(.numberLiteral(3), .numberLiteral(4))), .numberLiteral(5)), .numberLiteral(6))
//    )
//}

@Test func example2() async throws {
    let result = try expression.parse("123")
    print("\n\n\(result)\n\n")
}

