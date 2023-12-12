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
                deploymentTargets: env.deploymentTargets
            )
        }
        .organizationName(env.organizationName)
        .settings(.settings(configurations: env.appConfiguration))
        .scheme {
            Scheme.allSchemes(for: [typeName])
        }
    }
}
