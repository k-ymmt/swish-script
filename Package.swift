// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "swish-script",
    platforms: [.macOS(.v14)],
    products: [
        .executable(name: "SwishScript", targets: ["SwishScript"]),
        .library(name: "Siamese", targets: ["Siamese"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "600.0.0-latest"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "SwishScript",
            dependencies: [
                "Siamese",
            ]
        ),
        .testTarget(
            name: "SwishScriptTests",
            dependencies: [
                "SwishScript",
            ]
        ),
        .target(
            name: "Siamese",
            dependencies: ["SiameseMacros"]
        ),
        .testTarget(
            name: "SiameseTests",
            dependencies: [
                "Siamese"
            ]
        ),
        .macro(
            name: "SiameseMacros",
            dependencies: [
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax")
            ]
        ),
    ]
)
