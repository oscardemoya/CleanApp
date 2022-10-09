// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    products: [
        .library(
            name: "Data",
            targets: ["Data"])
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Data",
            dependencies: ["Domain"]),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"])
    ]
)
