extension Logger.Metadata {
    public static let designtuist: String = "is"

    public static let successKey: String = "success"
    public static var success: Logger.Metadata {
        [designtuist: .string(successKey)]
    }

    public static let sectionKey: String = "section"
    public static var section: Logger.Metadata {
        [designtuist: .string(sectionKey)]
    }

    public static let subsectionKey: String = "subsection"
    public static var subsection: Logger.Metadata {
        [designtuist: .string(subsectionKey)]
    }

    public static let prettyKey: String = "pretty"
    public static var pretty: Logger.Metadata {
        [designtuist: .string(prettyKey)]
    }
}
