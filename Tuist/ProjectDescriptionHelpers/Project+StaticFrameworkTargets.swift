import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    public static func staticFrameworkTargets(
        name: String,
        bundleID: String,
        dependencies: [TargetDependency]
    ) -> [Target] {
        let sources = Target(
            name: name,
            platform: .iOS,
            product: .staticFramework,
            bundleId: bundleID,
            deploymentTarget: .iOS(targetVersion: "14.0",
                                   devices: .iphone),
            infoPlist: .default,
            sources: ["../\(name)/Sources/**"],
            dependencies: dependencies
        )
        return [sources]
    }
}
