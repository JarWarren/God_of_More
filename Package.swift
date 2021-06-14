// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "GoM",
    platforms: [.macOS(.v11)],
    dependencies: [
         .package(url: "https://github.com/JarWarren/WarrenEngine", .branch("tiled")),
    ],
    targets: [
        .executableTarget(
            name: "GoM",
            dependencies: ["WarrenEngine"],
        resources: [.copy("Resources")]
        ),
        .testTarget(
            name: "GoMTests",
            dependencies: ["GoM"]),
    ]
)
