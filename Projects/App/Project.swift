import ProjectDescription
import ProjectDescriptionHelpers
import TuistUI

let project = App().module()

struct App: Module {
    @Constant var env = AppEnvironment()

    var body: some Module {
        Project {
            Interface(
                name: typeName,
                dependencies: [
                    .feature(
                        target: typeName,
                        type: .interface
                    )
                ]
            )
            Sources(
                name: typeName,
                dependencies: [
                    .feature(target: typeName)
                ]
            )
            
        }
        .organizationName(env.organizationName)
        .settings(.settings(
            base: env.baseSettings,
            configurations: env.configuration.configure(into: .app),
            defaultSettings: .recommended
        ))
    }
}
