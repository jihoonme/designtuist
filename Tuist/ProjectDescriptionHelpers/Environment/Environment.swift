import ProjectDescription
import TuistUI

public final class AppEnvironment: ModuleObject {
    public let organizationName = ""
    public let base: SettingsDictionary = [:]
    public let packageplatform: Set<ProjectDescription.PackagePlatform> = [.iOS]
    public let destinations = Destinations.iOS
    public let deploymentTargets = DeploymentTargets.iOS("16.0")
    public let configuration = AppConfiguration()
    public init() {}
}
