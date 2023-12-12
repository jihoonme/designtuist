import ProjectDescription
import Configuration

public extension Scheme {
    static func allSchemes(for targets: [String], executable: String? = nil) -> [Scheme] {
        targets.flatMap { target in
            AppConfiguration
                .allCases
                .map {
                    scheme(for: $0, target: target, executable: executable)
                }
        }
    }

    static func scheme(
        for env: some ConfigurationsType,
        target: String,
        executable: String? = nil
    ) -> Scheme {
        let configuration = env.configurationName
        var executableTarget: TargetReference?
        if let executable {
            executableTarget = "\(executable)"
        }
        return .scheme(
            name: "\(target)-\(env.rawValue)",
            shared: true,
            testAction: .targets(
                ["\(target)Tests"],
                configuration: configuration,
                options: .options(coverage: true, codeCoverageTargets: ["\(target)"])
            ),
            runAction: .runAction(
                configuration: configuration,
                executable: executableTarget
            ),
            archiveAction: .archiveAction(configuration: configuration),
            profileAction: .profileAction(
                configuration: configuration,
                executable: executableTarget
            ),
            analyzeAction: .analyzeAction(configuration: configuration)
        )
    }
    
    static func scheme(
        name: String,
        shared: Bool = true,
        hidden: Bool = false,
        buildAction: ProjectDescription.BuildAction? = nil,
        testAction: ProjectDescription.TestAction? = nil,
        runAction: ProjectDescription.RunAction? = nil,
        archiveAction: ProjectDescription.ArchiveAction? = nil,
        profileAction: ProjectDescription.ProfileAction? = nil,
        analyzeAction: ProjectDescription.AnalyzeAction? = nil
    ) -> Scheme {
        Scheme(
            name: name,
            shared: shared,
            hidden: hidden,
            buildAction: buildAction,
            testAction: testAction,
            runAction: runAction,
            archiveAction: archiveAction,
            profileAction: profileAction,
            analyzeAction: analyzeAction
        )
    }
}
