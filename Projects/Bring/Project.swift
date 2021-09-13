import ProjectDescription
import ProjectDescriptionHelpers

/*
                +-------------+
                |             |
                |     App     | Contains Reversed666IOS App target and Reversed666IOS unit-test target
                |             |
         +------+-------------+-------+
         |         depends on         |
         |                            |
 +----v-----+                   +-----v-----+
 |          |                   |           |
 |   Kit    |                   |     UI    |   Two independent frameworks to share code and start modularising your app
 |          |                   |           |
 +----------+                   +-----------+

 */

// MARK: - Project

// Creates our project using a helper function defined in ProjectDescriptionHelpers
let project = Project.excutable(
    name: "Bring",
    platform: .iOS,
    dependencies: [
        .sdk(name: "Foundation.framework", status: .required),
        .sdk(name: "UIKit.framework", status: .required),
        .sdk(name: "SwiftUI.framework", status: .required),
        .sdk(name: "Combine.framework", status: .required)
    ]
)
