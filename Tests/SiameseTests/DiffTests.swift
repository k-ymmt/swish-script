import Testing
@testable import Siamese

struct DiffTests {
    @Test func empty() async throws {
        #expect(throws: ParseError.self, performing: {
            try Diff(Digit(), to: Char("0")).parse("")
        })
    }
    @Test func allowDigit() async throws {
        let result = try Diff(Digit(), to: Char("0")).parse("5")
        #expect(result.rest == "")
        #expect(result.data == 5)
    }
    @Test func disallowChar() async throws {
        #expect(throws: ParseError.self, performing: {
            try Diff(Digit(), to: Char("0")).parse("a")
        })
    }
    @Test func ignoreNumber() async throws {
        #expect(throws: ParseError.self, performing: {
            try Diff(Digit(), to: Char("0")).parse("0")
        })
    }
}
