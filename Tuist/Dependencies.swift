import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/Moya/Moya",
                requirement: .upToNextMajor(from: "15.0.0"))
    ],
    platforms: [.iOS]
)
