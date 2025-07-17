import ProjectDescription
import ProjectDescriptionHelpers
import TuistUI

let project = BaseFeature().module()

struct BaseFeature: Module {

    var body: some Module {
        ProjectContainer(name: typeName, target: .feature) {
            Sources(name: typeName)
            Tests(name: typeName, dependencies: [
                .feature(target: typeName)
            ])
        }
    }
}
