// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "GoM",
    dependencies: [
        .package(url: "https://github.com/JarWarren/WarrenEngine", .branch("strega"))
    ],
    targets: [
        .executableTarget(
            name: "GoM",
            dependencies: ["WarrenEngine"],
            resources: [.process("Resources")]
        )
    ]
)
