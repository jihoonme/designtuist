import Foundation
import Command
import File

public final class InstallService {
    @Command(\.bash) var bash
    private var folder: Folder!

    public init() {}
    
    public func run(
        path: String?,
        dependency: String,
        version: String
    ) throws {
        let path = self.path(to: path)
        fetchDependencyCommand(path: path, dependency: dependency, version: version)
    }

    // Mark: - Helper

    private func path(to path: String?) -> Path {
        if let path {
            return Path(path)
        } else {
            return Path.current
        }
    }

    private func fetchDependencyCommand(
        path: Path,
        dependency: String,
        version: String
    ) {
        let folder = try? Folder(path: path).subfolder(at: "Tuist")
        let file = try? folder?.file(at: "Package.swift")
        
        let data = try? file?.read()
        
        if let readString = String(data: data ?? Data() , encoding: .utf8) {
            print(readString) // Output: Hello, File!
        }
    }
}
