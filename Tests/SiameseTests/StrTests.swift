import Testing
@testable import Siamese

struct StrTests {
    @Test func string() async throws {
        let result = try Str("aabb").parse("aabbccdd")
        #expect(result.rest == "ccdd")
        #expect(result.data == "aabb")
    }

    @Test func invalidString() async throws {
        #expect(throws: ParseError.self, performing: {
            try Str("aabb").parse("aabccdd")
        })
    }
}
