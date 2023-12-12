import Foundation
import DesignTuistSupport

final class VersionService {
    func run() throws {
        logger.notice("\(Constants.version)")
    }
}
