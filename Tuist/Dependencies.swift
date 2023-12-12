import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies(
        baseSettings: .settings(
            configurations: AppEnvironment().appConfiguration
        )
    ),
    platforms: AppEnvironment().packageplatform
)
