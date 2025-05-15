import ProjectDescription
import TuistUI

public struct Sources: TargetConvertable {
    let env = AppEnvironment()
    let name: String
    let product: Product
    let target: AppConfiguration.XCConfigTarget
    let dependencies: [TargetDependency]

    public init(
        name: String,
        product: Product = .staticLibrary,
        configuration target: AppConfiguration.XCConfigTarget = .shared,
        dependencies: [TargetDependency]
    ) {
        self.name = name
        self.product = product
        self.target = target
        self.dependencies = dependencies
    }

    public func build() -> ProjectDescription.Target {
        return Target(
            name: name,
            destinations: env.destinations,
            product: product,
            bundleId: "\(env.organizationName).\(name)",
            sources: .sources,
            settings: .settings(
                base: env.baseSettings,
                configurations: env.configuration.configure(into: target),
                defaultSettings: .recommended
            )
        ).build()
    }
}
