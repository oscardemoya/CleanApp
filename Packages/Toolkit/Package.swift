// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Toolkit",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "Toolkit",
            targets: ["Toolkit"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Toolkit",
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "ToolkitTests",
            dependencies: ["Toolkit"]
        )
    ]
)
