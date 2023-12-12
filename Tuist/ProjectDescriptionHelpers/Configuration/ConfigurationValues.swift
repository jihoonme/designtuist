import ProjectDescription
import Configuration

extension ConfigurationValues {
    var `default`: [ProjectDescription.Configuration] {
        ConfigurationGroup {
            Debug(AppConfiguration.dev)
            Release(AppConfiguration.stage)
            Release(AppConfiguration.prod)
        }
    }
}
