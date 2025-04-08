// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DJWCommon",
    
    platforms: [
        .iOS(.v13),
        .macOS(.v10_12),
        .tvOS(.v10)
    ],
    
    products: [
        .library(
            name: "DJWCommon",
            targets: ["DJWCommon"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/trevor-sonic/DJWBuilderNS.git", from: "1.0.0"),
    ], 
    
    targets: [
        .target(
            name: "DJWCommon",
            dependencies: [
                "DJWBuilderNS"
        ]),
        .testTarget(
            name: "DJWCommonTests",
            dependencies: ["DJWCommon"]),
    ]
)
