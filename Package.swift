// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "GoM",
    platforms: [.macOS(.v11)],
    dependencies: [
        .package(url: "https://github.com/JarWarren/WarrenEngine", .branch("testless"))
    ],
    targets: [
        .executableTarget(
            name: "GoM",
            dependencies: ["WarrenEngine"],
            resources: [.process("Resources")]
        )
    ]
)
