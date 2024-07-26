import Testing
@testable import Siamese

struct ListTests {
    var parser: List<Digit, Char> {
        List(Digit(), delimiter: Char(","))
    }
    @Test func inputMany() async throws {
        let result = try parser.parse("1,2,3,4,5")
        #expect(result.data == [1, 2, 3, 4, 5])
        #expect(result.rest == "")
    }
}
