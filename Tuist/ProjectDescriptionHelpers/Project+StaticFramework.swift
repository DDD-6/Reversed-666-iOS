import ProjectDescription

/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    public static func staticFramework(
        name: String,
        organizationName: String,
        targets: [Target]
    ) -> Project {

        return Project(
            name: name,
            organizationName: organizationName,
            targets: targets
        )
    }
    
}
