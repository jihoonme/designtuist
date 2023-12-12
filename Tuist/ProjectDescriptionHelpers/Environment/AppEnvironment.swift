import ProjectDescription
import TuistUI
import Configuration

public final class AppEnvironment: EnvironmentObject {
    @Configurations(\.default) public var appConfiguration
    public let organizationName = ""
    public let base: SettingsDictionary = [:]
    public let packageplatform: Set<ProjectDescription.PackagePlatform> = [.iOS]
    public let destinations = Destinations.iOS
    public let deploymentTargets = DeploymentTargets(iOS: "16.0")
    public init() {}
}
