import ProjectDescription
import TuistUI

public struct Example: TargetConvertable {
    let env = AppEnvironment()
    let name: String
    let target: AppConfiguration.XCConfigTarget
    let dependencies: [TargetDependency]

    public init(
        name: String,
        configuration target: AppConfiguration.XCConfigTarget = .shared,
        dependencies: [TargetDependency]
    ) {
        self.name = name + "Example"
        self.target = target
        self.dependencies = dependencies
    }

    public func build() -> ProjectDescription.Target {
        return Target(
            name: name,
            destinations: env.destinations,
            product: .app,
            bundleId: "\(env.organizationName).\(name)",
            infoPlist: .extendingDefault(with: [
                "UIMainStoryboardFile": "",
                "UILaunchStoryboardName": "LaunchScreen",
                "ENABLE_TESTS": .boolean(true),
            ]),
            sources: .example,
            settings: .settings(
                base: env.baseSettings,
                configurations: env.configuration.configure(into: target),
                defaultSettings: .recommended
            )
        ).build()
    }
}
