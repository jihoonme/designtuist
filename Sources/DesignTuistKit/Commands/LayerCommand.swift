import ArgumentParser
import Foundation
import DesignTuistSupport

struct LayerCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "layer",
            abstract: "Serves to set up layers"
        )
    }

    func run() throws {}
}
