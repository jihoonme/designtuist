import ArgumentParser
import Foundation
import DesignTuistSupport

struct GenerateCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "generate",
            abstract: "Generates an Xcode workspace to start working on the project."
        )
    }

    func run() throws {}
}
