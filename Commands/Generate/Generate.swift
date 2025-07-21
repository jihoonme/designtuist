import CommandKit

@main
struct GenerateCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(commandName: "generate")
    }
    
    func run() throws {
        LoggingSystem.bootstrap { label in
            OSLogHandler(label: label)
        }

        
    }
}
