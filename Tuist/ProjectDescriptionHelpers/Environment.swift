import ProjectDescription
import TuistUI

public struct AppEnvironment: ModuleObject {
    public let organizationName = ""
    public let base: SettingsDictionary = [:]
    public let packageplatform: [ProjectDescription.PackagePlatform] = [.iOS]
    public let destinations = Destinations.iOS
    public let deploymentTargets = DeploymentTargets.iOS("16.0")
    public let configuration = AppConfiguration()
    public init() {}
}
