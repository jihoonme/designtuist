import CommandKit

@main
struct ModuleCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "module"
        )
    }

    @Option(
        name: .shortAndLong,
        help: "Path to the project directory",
        completion: .directory
    )
    var path: String?

    func run() throws {
        LoggingSystem.bootstrap { label in
            OSLogHandler(label: label)
        }

        try ModuleService().run(path: path)
    }
}
