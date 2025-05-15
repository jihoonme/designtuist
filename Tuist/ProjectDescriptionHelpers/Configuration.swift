import ProjectDescription
import TuistUI

public struct AppConfiguration: XCConfig {
    public enum XCConfigTarget: String, XCConfigTargetType {
        case app
        case domain
        case feature
        case core
        case shared

        public var path: Path {
            switch self {
            case .app:
                return .relativeToConfiguration("App")
            case .domain:
                return .relativeToConfiguration("Domain")
            case .feature:
                return .relativeToConfiguration("Feature")
            case .core:
                return .relativeToConfiguration("Core")
            case .shared:
                return .relativeToConfiguration("shared.xcconfig")
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
            case .domain:
                return [
                    .debug(into: $0, name: .dev),
                    .debug(into: $0, name: .stage),
                    .debug(into: $0, name: .prod)
                ]
            case .feature:
                return [
                    .debug(into: $0, name: .dev),
                    .debug(into: $0, name: .stage),
                    .debug(into: $0, name: .prod)
                ]
            case .core:
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
