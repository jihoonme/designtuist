import ProjectDescription

let config = Config(
    plugins: [
        .local(path: .relativeToManifest("../../Plugins/TuistTemplate")),
        .local(path: .relativeToRoot("/Plugins/"))
    ]
)
