import ArgumentParser
import Foundation
import DesignTuistSupport

struct ModuleCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "module",
            abstract: "Helps you create modules"
        )
    }
    func run() throws {}
}
