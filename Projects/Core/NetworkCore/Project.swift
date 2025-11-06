import ProjectDescription
import ProjectDescriptionHelpers
import TuistUI

let project = NetworkCore().module()

struct NetworkCore: Module {
    var body: some Module {
        ProjectContainer(
            name: typeName,
            target: .Core
        ) {
            Sources(name: typeName)
            Tests(
                name: typeName,
                dependencies: [
                    .core(target: typeName)
                ]
            )
        }
    }
}
