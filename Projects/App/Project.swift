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
                infoPlist: .file(path: "iOS/Support/Info.plist"),
                sources: "iOS/Sources/**",
                resources: ["iOS/Resources/**"],
                configuration: .App,
                dependencies: [
                    .feature(target: "BaseFeature"),
                    .domain(target: "BaseDomain"),
                    .core(target: "NetworkCore"),
                    .shared(target: "Utility")
                ]
            )
        }
        .organizationName(env.organizationName)
        .settings(.settings(
            base: env.baseSettings,
            configurations: env.configuration.configure(into: .App),
            defaultSettings: .recommended
        ))
        .scheme {
            Scheme.scheme(
                name: "\(typeName)-dev",
                shared: true,
                buildAction: .buildAction(targets: ["\(typeName)"]),
                runAction: .runAction(configuration: .dev),
                archiveAction: .archiveAction(configuration: .dev),
                profileAction: .profileAction(configuration: .dev),
                analyzeAction: .analyzeAction(configuration: .dev)
            )
            Scheme.scheme(
                name: "\(typeName)-stage",
                shared: true,
                buildAction: .buildAction(targets: ["\(typeName)"]),
                runAction: .runAction(configuration: .stage),
                archiveAction: .archiveAction(configuration: .stage),
                profileAction: .profileAction(configuration: .stage),
                analyzeAction: .analyzeAction(configuration: .stage)
            )
            Scheme.scheme(
                name: "\(typeName)-prod",
                shared: true,
                buildAction: .buildAction(targets: ["\(typeName)", "\(typeName)Widget"]),
                runAction: .runAction(configuration: .prod),
                archiveAction: .archiveAction(configuration: .prod),
                profileAction: .profileAction(configuration: .prod),
                analyzeAction: .analyzeAction(configuration: .prod)
            )
        }
    }
}
