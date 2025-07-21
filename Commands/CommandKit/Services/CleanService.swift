import Foundation
import Command
import File

public final class CleanService {
    @Command(\.tuist) var tuist
    private var folder: Folder!

    public init() {}
    
    public func run(path: String?) throws {
        let path = self.path(to: path)
        fetchCleanCommand(path: path)
    }

    // Mark: - Helper

    private func path(to path: String?) -> Path {
        if let path {
            return Path(path)
        } else {
            return Path.current
        }
    }

    private func fetchCleanCommand(path: Path) {
        let path = path.rawValue
        if tuist.clean(at: path).errorOutput.isEmpty {
            logger.info("✅ Tuist Clean Command successfully")
        } else {
            logger.error("❌ Tuist Clean Command failed")
        }
    }

    private func fetchClean(path: Path) {
    
    }
}
