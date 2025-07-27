// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "Presentation",
            targets: ["Presentation"]
        )
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../UIComponents"),
        .package(path: "../DesignSystem")
    ],
    targets: [
        .target(
            name: "Presentation",
            dependencies: [
                "Domain",
                "UIComponents",
                "DesignSystem"
            ]
        ),
        .testTarget(
            name: "PresentationTests",
            dependencies: ["Presentation"]
        )
    ]
)
