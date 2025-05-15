import ProjectDescription
import TuistUI

public struct AppConfiguration: XCConfig {
    public enum XCConfigTarget: String, XCConfigTargetType {
        case app
        case shared

        public var path: Path {
            switch self {
            case .app:
                return .relativeToRoot("Configuration/App")
            case .shared:
                return .relativeToRoot("Configuration/shared.xcconfig")
            }
        }
    }
    
    public var body: some XCConfigOf<Self> {
        Configure({
            switch $0 {
            case .app:
                return [
                    .debug(into: $0, name: .dev),
                    .debug(into: $0, name: .stage),
                    .debug(into: $0, name: .prod)
                ]
            case .shared:
                return [
                    .debug(name: .dev, xcconfig: $0.path),
                    .debug(name: .prod, xcconfig: $0.path),
                    .debug(name: .stage, xcconfig: $0.path)
                ]
            }
        })
    }
}
