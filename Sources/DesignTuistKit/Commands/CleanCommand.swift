import ArgumentParser
import Foundation
import DesignTuistSupport

struct CleanCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "clean",
            abstract: "Clean all the artifacts stored locally"
        )
    }
    
    func run() throws {
        try CleanService().run()
    }
}
