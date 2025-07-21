import Foundation
import Command
import File

public enum GenerateType: String, ExpressibleByArgument {
    case `default` = ""
    case ci = "CI"
    case cd = "CD"
}

public final class GenerateService {
    
    public init() {}

    public func run(
        type: GenerateType,
        path: String?,
    ) throws {
        let path = self.path(to: path)
    }

    // Mark: - Helper

    private func path(to path: String?) -> Path {
        if let path {
            return Path(path)
        } else {
            return Path.current
        }
    }

    private func 
}
