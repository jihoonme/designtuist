import ProjectDescription
import ProjectDescriptionHelpers
import TuistUI

let project = App().module()

struct App: Module {
    @Constant var env = AppEnvironment()

    var body: some Module {
        Project {
            Sources(
                name: typeName,
                product: .app,
                infoPlist: .file(path: "Support/Info.plist"),
                resources: ["Resources/**"],
                configuration: .app,
                dependencies: [
                    .feature(target: "BaseFeature"),
                    .domain(target: "BaseDomain"),
                    .core(target: "CoreNetwork"),
                    .shared(target: "Shared")
                ]
            )
        }
        .organizationName(env.organizationName)
        .settings(.settings(
            base: env.baseSettings,
            configurations: env.configuration.configure(into: .app),
            defaultSettings: .recommended
        ))
        .scheme {
            Scheme.makeScheme(
                name: typeName,
                target: .dev
            )
            Scheme.makeScheme(
                name: typeName,
                target: .stage
            )
            Scheme.makeScheme(
                name: typeName,
                target: .prod
            )
        }
    }
}
