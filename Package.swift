// swift-tools-version: 5.9
import PackageDescription

let swiftToolsSupportDependency: Target.Dependency = .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core")
let loggingDependency: Target.Dependency = .product(name: "Logging", package: "swift-log")
let argumentParserDependency: Target.Dependency = .product(name: "ArgumentParser", package: "swift-argument-parser")

var targets: [Target] = [
    .executableTarget(
        name: "dt",
        dependencies: [
            "DesignTuistKit",
            argumentParserDependency
        ]
    ),
    .target(
        name: "DesignTuistKit",
        dependencies: [
            swiftToolsSupportDependency,
            argumentParserDependency,
            "DesignTuistSupport"
        ]
    ),
    .target(
        name: "DesignTuistSupport",
        dependencies: [
            swiftToolsSupportDependency,
            argumentParserDependency,
            loggingDependency
        ]
    ),
    .testTarget(
        name: "DesignTuistCLITests",
        dependencies: ["dt"]
    ),
]

let package = Package(
    name: "designtuist",
    platforms: [.macOS(.v12)],
    products: [
        .executable(name: "dt", targets: ["dt"]),
        .library(name: "DesignTuistKit", targets: ["DesignTuistKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-tools-support-core", from: "0.6.1"),
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.3"),
        .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-log", from: "1.5.3"),
        .package(url: "https://github.com/pelagornis/plcommand", from: "1.2.1")
    ],
    targets: targets
)
