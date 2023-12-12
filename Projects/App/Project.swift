import ProjectDescription
import ProjectDescriptionHelpers
import TuistUI
import Microfeature

let project = DesignTuistApp().makeModule()

struct DesignTuistApp: Module {
    @ModuleEnvironment var env = AppEnvironment()

    var body: some Module {
        Project {
            Target(
                name: typeName,
                destinations: env.destinations,
                product: .app,
                bundleId: "\(env.organizationName).\(typeName)",
                deploymentTargets: env.deploymentTargets,
                infoPlist: .file(path: "Support/Info.plist"),
                sources: ["Sources/**"],
                resources: ["Resources/**"],
                settings: .settings(base: env.base)
            )
        }
        .organizationName(env.organizationName)
        .settings(.settings(
            base: env.base,
            configurations: env.appConfiguration,
            defaultSettings: .recommended
        ))
        .scheme {
            Scheme.allSchemes(for: [typeName])
        }
    }
}
