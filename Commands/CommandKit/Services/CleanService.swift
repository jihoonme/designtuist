import Foundation
import Command
import File

public final class CleanService {
    @Command(\.tuist) var tuist
    private var folder: Folder!

    public init() {}
    
    public func run(path: String?) throws {
        let path = self.path(to: path)
        cleanXcodeProject(path: path)
        runCleanCommand(path: path)
    }

    // Mark: - Helper

    private func path(to path: String?) -> Path {
        if let path {
            return Path(path)
        } else {
            return Path.current
        }
    }

    private func runCleanCommand(path: Path) {
        let path = path.rawValue
        if tuist.clean(at: path).errorOutput.isEmpty {
            logger.info("✅ Tuist Clean Command successfully")
        } else {
            logger.error("❌ Tuist Clean Command failed")
        }
    }

    private func cleanXcodeProject(path: Path) {
        let folder = try? Folder(path: path)
        let targets = folder?.allFolders(recursive: true).filter {
            $0.extension == "xcodeproj" || $0.extension == "xcworkspace"
        }
        if let _ = targets?.isEmpty {
            logger.info("ℹ️ No .xcodeproj or .xcworkspace directories found.")
            return
        }

        targets?.forEach { file in
            do {
                try file.delete()
                logger.info("✅ Removed \(file.name)")
            } catch {
                logger.error("❌ Failed to delete \(file.name): \(error)")
            }
        }
    }
}
