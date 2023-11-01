import ProjectDescription
import ProjectDescriptionHelpers
import TuistUI

@Project
struct TuistApp: Module {
    var body: some Module {
        Project {
            
        }
    }
}


//// Creates our project using a helper function defined in ProjectDescriptionHelpers
//let project = Project.app(name: "TuistTemplate",
//                          platform: .iOS,
//                          additionalTargets: ["TuistTemplateKit", "TuistTemplateUI"])
