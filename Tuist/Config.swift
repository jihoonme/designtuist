import ProjectDescription

let config = Config(
    plugins: [
        .git(url: "https://github.com/jihoonahn/tuistui", tag: "0.1.5"),
        .git(url: "https://github.com/jihoonahn/microfeature", tag: "0.1.1"),
        .git(url: "https://github.com/jihoonahn/configuration", tag: "0.1.1")
    ]
)
