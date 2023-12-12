import Foundation
import Logging

public struct StandardLogHandler: LogHandler {
    public var logLevel: Logger.Level

    public let label: String

    public init(label: String) {
        self.init(label: label, logLevel: .info)
    }

    public init(label: String, logLevel: Logger.Level) {
        self.label = label
        self.logLevel = logLevel
    }

    public func log(
        level: Logger.Level,
        message: Logger.Message,
        metadata: Logger.Metadata?,
        file _: String, function _: String, line _: UInt
    ) {
        if let metadata, metadata[Logger.Metadata.designtuist] == .string(Logger.Metadata.prettyKey) {
            return
        }

        let string: String
        string = message.description
        output(for: level).print(string)
    }

    func output(for level: Logger.Level) -> FileHandle {
        level < .error ? .standardOutput : .standardError
    }

    public var metadata = Logger.Metadata()

    public subscript(metadataKey key: String) -> Logger.Metadata.Value? {
        get { metadata[key] }
        set { metadata[key] = newValue }
    }
}

extension FileHandle {
    func print(_ string: String, terminator: String = "\n") {
        (string + terminator).data(using: .utf8)
            .map(write)
    }
}

func ~= (lhs: String, rhs: Logger.MetadataValue) -> Bool {
    switch rhs {
    case let .string(s): return lhs == s
    default: return false
    }
}
