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
        ],
        path: "Commands/Sources/dt"
    ),
    .target(
        name: "DesignTuistKit",
        dependencies: [
            swiftToolsSupportDependency,
            argumentParserDependency,
            "DesignTuistSupport"
        ],
        path: "Commands/Sources/DesignTuistKit"
    ),
    .target(
        name: "DesignTuistSupport",
        dependencies: [
            swiftToolsSupportDependency,
            argumentParserDependency,
            loggingDependency
        ],
        path: "Commands/Sources/DesignTuistSupport"
    ),
    .testTarget(
        name: "DesignTuistCLITests",
        dependencies: ["dt"],
        path: "Commands/Tests/DesignTuistCLITests"
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
        .package(url: "https://github.com/pelagornis/plcommand", from: "1.2.5"),
        .package(url: "https://github.com/pelagornis/plfile", from: "1.0.6")
    ],
    targets: targets
)
