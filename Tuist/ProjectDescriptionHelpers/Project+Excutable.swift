import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    public static func excutable(
        name: String,
        organizationName: String,
        platform: Platform,
        dependencies: [TargetDependency]
    ) -> Project {
        
        return Project(
            name: name,
            organizationName: organizationName,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: .app,
                    bundleId: "\(organizationName).\(name)",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
                    infoPlist: .extendingDefault(
                        with: [
                            "CFBundleShortVersionString": "1.0.0",  // App Version
                            "CFBundleVersion": "1", // Build version
                            "UIMainStoryboardFile": "",
                            "UILaunchStoryboardName": "LaunchScreen"
                        ]
                    ),
                    sources: ["Sources/**"],
                    resources: ["Resources/**"],
                    dependencies: dependencies
                ),
                Target(
                    name: "\(name)Tests",
                    platform: platform,
                    product: .unitTests,
                    bundleId: "\(organizationName).\(name)Tests",
                    deploymentTarget: .iOS(targetVersion: "15.0", devices: .iphone),
                    infoPlist: .default,
                    sources: ["Tests/**"],
                    dependencies: [
                        .target(name: "\(name)")
                    ]
                )
            ]
        )
    }
}
