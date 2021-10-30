import ProjectDescription
import ProjectDescriptionHelpers

// MARK: - Project

let projectName = "Bring"
let organizationName = "com.666"
let bundleID = "\(organizationName).\(projectName)"

let project = Project.excutable(
    name: projectName,
    organizationName: organizationName,
    platform: .iOS,
    dependencies: [
        .project(target: "Repository", path: "../Repository"),
        .external(name: "BottomSheet"),
    ]
)
