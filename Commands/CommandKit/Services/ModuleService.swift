import Foundation
import Command
import File

public final class ModuleService {
    private var folder: Folder!

    public init() {}
    
    public func run(path: String?) throws {
        let path = self.path(to: path)
        runningGenerateModule(path: path)
    }

    // Mark: - Helper

    private func path(to path: String?) -> Path {
        if let path {
            return Path(path)
        } else {
            return Path.current
        }
    }
    
    private func runningGenerateModule(path: Path) {
        print("")
    }
}
