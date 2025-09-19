import ProjectDescription

private let layer = Template.Attribute.required("layer")
private let name = Template.Attribute.required("name")

private let template = Template(
    description: "A template for a new module's example target",
    attributes: [
        layer,
        name
    ],
    items: [
        .file(
            path: "Projects/\(layer)/\(name)/Example/Sources/App.swift",
            templatePath: "App.stencil"
        ),
        .file(
            path: "Projects/\(layer)/\(name)/Example/Resources/LaunchScreen.storyboard",
            templatePath: "LaunchScreen.stencil"
        )
    ]
)
