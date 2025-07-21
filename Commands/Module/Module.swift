import CommandKit

@main
struct ModuleCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "module"
        )
    }

    func run() throws {
        LoggingSystem.bootstrap { label in
            OSLogHandler(label: label)
        }
    }
}
