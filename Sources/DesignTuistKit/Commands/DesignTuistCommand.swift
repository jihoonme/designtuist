@_exported import ArgumentParser
import Foundation
import DesignTuistSupport

public struct DesignTuistCommand: AsyncParsableCommand {
    public init() {}

    public static var configuration: CommandConfiguration {
        CommandConfiguration(
            commandName: "dt",
            abstract: "",
            subcommands: [
                CleanCommand.self,
                GenerateCommand.self,
                LayerCommand.self,
                ModuleCommand.self,
                VersionCommand.self
            ]
        )
    }
}
