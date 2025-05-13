import ProjectDescription
import ProjectDescriptionHelpers
import TuistUI

let project = App().module()

struct App: Module {
    @Constant var env = AppEnvironment()

    var body: some Module {
        Project {
            Interface(name: typeName)
        }
        .organizationName(env.organizationName)
        .settings(.settings(
            base: env.base,
            configurations: env.configuration.configure(into: .app),
            defaultSettings: .recommended
        ))
    }
}
