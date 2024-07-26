import Testing
@testable import Siamese

struct AnyCharTests {
    @Test func empty() async throws {
        #expect(throws: ParseError.self, performing: {
            try AnyChar().parse("")
        })
    }

    @Test func oneCharacter() async throws {
        let result = try AnyChar().parse("a")
        #expect(result.rest == "")
        #expect(result.data == "a")
    }

    @Test func manyCharacters() async throws {
        let result = try AnyChar().parse("aaa")
        #expect(result.rest == "aa")
        #expect(result.data == "a")
    }
}
