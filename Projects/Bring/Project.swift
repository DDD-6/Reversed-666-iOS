import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "Bring"

let project = Project.excutable(
    name: projectName,
    platform: .iOS,
    dependencies: [
        //.cocoapods(path: "../../"),
        //.project(target: "DodiRepository", path: "../DodiRepository"),
        //.project(target: "DodiCore", path: "../DodiCore"),
//        .sdk(name: "SwiftUI.framework", status: .required),
//        .sdk(name: "Combine.framework", status: .required)
    ]
)
