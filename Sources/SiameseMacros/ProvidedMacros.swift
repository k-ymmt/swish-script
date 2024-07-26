import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct SiameseMacrosMacros: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ConcatMacro.self,
        MergeMacro.self
    ]
}
