// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "Data",
            targets: ["Data"]
        )
    ],
    dependencies: [
        .package(path: "../Toolkit"),
        .package(path: "../CleanArchitecture"),
        .package(path: "../Domain"),
        .package(path: "../Networking")
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: [
                "Toolkit",
                "CleanArchitecture",
                "Domain",
                "Networking"
            ],
            path: "Sources",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]
        )
    ]
)
