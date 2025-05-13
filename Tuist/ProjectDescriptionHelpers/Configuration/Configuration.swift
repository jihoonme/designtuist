import ProjectDescription
import TuistUI

public struct AppConfiguration: XCConfig {
    public enum XCConfigTarget: String, XCConfigTargetType {
        case app

        public var path: Path {
            switch self {
            case .app:
                return .relativeToRoot("XCConfig/app")
            }
        }
    }
    
    public var body: some XCConfigOf<Self> {
        Configure({
            switch $0 {
            case .app:
                return []
            }
        })
    }
}
