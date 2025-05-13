import ProjectDescription
import TuistUI

public struct Interface: TargetConvertable {

    public init() {}

    public func build() -> ProjectDescription.Target {
        Target(name: "", destinations: .iOS, product: .app, bundleId: "").build()
    }
}
