import ProjectDescription
import TuistUI

public struct Interface: TargetConvertable {
    let name: String
    let modifier = TargetModifier(name: "", destinations: .iOS, product: .app, productName: "", bundleId: "", deploymentTargets: .iOS("15.0"), infoPlist: .default, sources: .interface, resources: .none, copyFiles: [], headers: .none, entitlements: .none, scripts: [], dependencies: [], settings: .none, coreDataModels: [], environmentVariables: [:], launchArguments: [], additionalFiles: [], buildRules: [], mergedBinaryType: .disabled, mergeable: true, onDemandResourcesTags: .none)
    public init(name: String) {
        self.name = name
    }

    
    public func build() -> ProjectDescription.Target {
        return .target("", modifier: <#T##TargetModifier#>)
    }
}

public struct Sources: TargetConvertable {

    public init(name: String) {}

    public func build() -> ProjectDescription.Target {
        Target(name: "", destinations: .iOS, product: .app, bundleId: "").build()
    }
}
