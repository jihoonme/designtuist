import CommandKit

@main
struct CleanCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(commandName: "clean")
    }
    
    func run() throws {
        
    }
}
