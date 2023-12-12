import ProjectDescription
import TuistUI

let workspace = DesignTuistApp().makeModule()

struct DesignTuistApp: Module {
    var body: some Module {
        Workspace {
            Path("Projects/App")
        }
    }
}
