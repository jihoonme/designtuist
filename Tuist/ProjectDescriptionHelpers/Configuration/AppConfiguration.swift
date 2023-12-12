import ProjectDescription
import Configuration

public enum AppConfiguration: String, ConfigurationsType {
    case dev = "DEV"
    case stage = "STAGE"
    case prod = "PROD"
    
    public var path: Path {
        .relativeToRoot("Configuration/Shared.xcconfig")
    }
}
