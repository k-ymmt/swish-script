import Testing
@testable import Siamese

struct EmptyTests {
    @Test func empty() async throws {
        #expect(throws: Never.self, performing: {
            try Empty().parse("")
        })
    }

    @Test func oneCharacter() async throws {
        #expect(throws: ParseError.self, performing: {
            try Empty().parse("a")
        })
    }
}
