import Testing
@testable import Siamese

struct WhitespaceTests {
    var parser: Whitespace {
        .init()
    }
    @Test func empty() async throws {
        let result = try parser.parse("")
        #expect(result.rest == "")
    }

    @Test func noWhitespace() async throws {
        let result = try parser.parse("abc")
        #expect(result.rest == "abc")
    }

    @Test func oneWhitespace() async throws {
        let result = try parser.parse(" abc")
        #expect(result.rest == "abc")
    }

    @Test func multipleWhitespace() async throws {
        let result = try parser.parse("   abc")
        #expect(result.rest == "abc")
    }
}
