import ProjectDescription
import TuistUI

let workspace = App().module()

struct App: Module {
    var body: some Module {
        Workspace {
            Path("Projects/App")
        }
    }
}
