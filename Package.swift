// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aris-common",
    platforms: [
       .macOS(.v12),
       .iOS(.v15)
    ],
    products: [
        .library(name: "ArisCommon", targets: ["ArisCommon"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "ArisCommon", dependencies: []),
        .testTarget(name: "ArisCommonTests", dependencies: ["ArisCommon"]),
    ]
)
