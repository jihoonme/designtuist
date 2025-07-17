import ProjectDescription
import ProjectDescriptionHelpers
import TuistUI

let project = Shared().module()

struct Shared: Module {
    var body: some Module {
        ProjectContainer(name: typeName, target: .shared) {
            Sources(name: typeName)
            Tests(
                name: typeName,
                dependencies: [
                    .shared(target: typeName)
                ]
            )
        }
    }
}
