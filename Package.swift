// swift-tools-version: 5.9
import PackageDescription

let loggingDependency: Target.Dependency = .product(name: "Logging", package: "swift-log")
let argumentParserDependency: Target.Dependency = .product(name: "ArgumentParser", package: "swift-argument-parser")

var targets: [Target] = [
    .executableTarget(
        name: "dt",
        dependencies: [
            "DesignTuistKit",
            argumentParserDependency
        ],
        path: "CommandLine/Sources/dt"
    ),
    .target(
        name: "DesignTuistKit",
        path: "CommandLine/Sources/DesignTuistKit"
    ),
    .testTarget(
        name: "DesignTuistCLITests",
        dependencies: ["dt"],
        path: "CommandLine/Tests"
    ),
]

let package = Package(
    name: "designtuist",
    products: [
        .executable(name: "dt", targets: ["dt"]),
        .library(name: "DesignTuistKit", targets: ["DesignTuistKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.3"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-log", from: "1.5.3"),
        .package(url: "https://github.com/pelagornis/plcommand", from: "1.2.1")
    ],
    targets: targets
)
