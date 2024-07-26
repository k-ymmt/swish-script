import Testing
@testable import Siamese

struct CharTests {
    @Test func empty() async throws {
        #expect(throws: ParseError.self, performing: {
            try Char("a").parse("")
        })
    }

    @Test func matchCharacter() async throws {
        let result = try Char("a").parse("abc")
        #expect(result.rest == "bc")
        #expect(result.data == "a")
    }

    @Test func notMatchCharacter() async throws {
        #expect(throws: ParseError.self, performing: {
            try Char("a").parse("bc")
        })
    }
}
