import ProjectDescription
import TuistUI

public struct AppConfiguration: XCConfig {
    public enum XCConfigTarget: String, XCConfigTargetType {
        case app
        case domain
        case feature
        case core
        case shared

        public func path(for config: ConfigurationName) -> ProjectDescription.Path {
            switch self {
            case .app:
                return .relativeToConfiguration("App/\(config.rawValue).xcconfig")
            case .domain:
                return .relativeToConfiguration("Domain/\(config.rawValue).xcconfig")
            case .feature:
                return .relativeToConfiguration("Feature/\(config.rawValue).xcconfig")
            case .core:
                return .relativeToConfiguration("Core/\(config.rawValue).xcconfig")
            case .shared:
                return .relativeToConfiguration("Shared/\(config.rawValue).xcconfig")
            }
        }
    }
    
    public var body: some XCConfigOf<Self> {
        Configure({
            switch $0 {
            case .app:
                return [
                    .debug(name: .dev, xcconfig: $0.path(for: .dev)),
                    .debug(name: .stage, xcconfig: $0.path(for: .stage)),
                    .release(name: .prod, xcconfig: $0.path(for: .prod))
                ]
            case .domain:
                return [
                    .debug(name: .dev, xcconfig: $0.path(for: .dev)),
                    .debug(name: .stage, xcconfig: $0.path(for: .stage)),
                    .release(name: .prod, xcconfig: $0.path(for: .prod))
                ]
            case .feature:
                return [
                    .debug(name: .dev, xcconfig: $0.path(for: .dev)),
                    .debug(name: .stage, xcconfig: $0.path(for: .stage)),
                    .release(name: .prod, xcconfig: $0.path(for: .prod))
                ]
            case .core:
                return [
                    .debug(name: .dev, xcconfig: $0.path(for: .dev)),
                    .debug(name: .stage, xcconfig: $0.path(for: .stage)),
                    .release(name: .prod, xcconfig: $0.path(for: .prod))
                ]
            case .shared:
                return [
                    .debug(name: .dev, xcconfig: $0.path(for: .dev)),
                    .debug(name: .stage, xcconfig: $0.path(for: .stage)),
                    .release(name: .prod, xcconfig: $0.path(for: .prod))
                ]
            }
        })
    }
}
