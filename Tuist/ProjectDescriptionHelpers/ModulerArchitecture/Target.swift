import ProjectDescription
import TuistUI

public extension TargetConvertable {
    static func target(_ name: String, product: Product? = nil, modifier: TargetModifier) -> ProjectDescription.Target {
        let env = AppEnvironment()
        return modifier.build()
    }
}
