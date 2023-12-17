import Foundation
import TSCBasic
import DesignTuistKit
import DesignTuistSupport

@main
private enum DesignTuist {
    static func main() async throws {
        if CommandLine.arguments.contains("--verbose") {
            try? ProcessEnv.setVar(Constants.EnvironmentVariables.verbose, value: "true")
        }

        DesignTuistSupport.LogOutput.bootstrap()
        
        await DesignTuistCommand.main()
    }
}
