// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Networking",
    defaultLocalization: "en",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(
            name: "Networking",
            targets: ["Networking"]
        )
    ],
    targets: [
        .target(
            name: "Networking"
        ),
        .testTarget(
            name: "NetworkingTests",
            dependencies: ["Networking"]
        )
    ]
)
