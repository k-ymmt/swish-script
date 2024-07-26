import Testing
@testable import Siamese

struct BooleanTests {
    @Test func parseTrue() async throws {
        let result = try BooleanLiteral().parse("true")
        #expect(result.data == true)
        #expect(result.rest == "")
    }

    @Test func parseFalse() async throws {
        let result = try BooleanLiteral().parse("false")
        #expect(result.data == false)
        #expect(result.rest == "")
    }

    @Test func failed() async throws {
        #expect(throws: ParseError.self, performing: {
            try BooleanLiteral().parse("hoge")
        })
    }
}
