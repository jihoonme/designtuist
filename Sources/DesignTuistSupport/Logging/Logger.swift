import class Foundation.ProcessInfo
@_exported import Logging

let logger = Logger(label: "me.jihoon.support")

public struct LoggingConfig {
    public enum LoggerType {
        case console
        case detailed
        case osLog
    }

    public var loggerType: LoggerType
    public var verbose: Bool
}
