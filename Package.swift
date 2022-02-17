// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitTheme",
    platforms: [
        .iOS(.v11),
//        .macOS(.v12),
        .tvOS(.v9),
        .watchOS(.v8),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "UIKitTheme",
            targets: [
                "UIKitTheme",
            ]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/yannickl/DynamicColor", from: "5.0.0"),
        .package(url: "https://github.com/Appsaurus/Swiftest", from: "0.0.1"),
        .package(url: "https://github.com/Appsaurus/UIKitMixinable", from: "1.0.0"),
        .package(url: "https://github.com/Appsaurus/UIKitExtensions", from: "1.0.0"),
        .package(url: "https://github.com/Appsaurus/DarkMagic", from: "0.0.1")
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "UIKitTheme",
            dependencies: [
                .product(name: "DynamicColor", package: "DynamicColor"),
                .product(name: "Swiftest", package: "Swiftest"),
                .product(name: "UIKitMixinable", package: "UIKitMixinable"),
                .product(name: "UIKitExtensions", package: "UIKitExtensions"),
                .product(name: "DarkMagic", package: "DarkMagic")
            ],
            path: "Sources/UIKitTheme/",
            resources: [
                .process("Resources"),
            ]
        ),
        .testTarget(
            name: "UIKitThemeTests",
            dependencies: [
                "UIKitTheme",
            ],
            path: "Tests/UIKitTheme/",
            exclude: [
                "Resources/README.md",
                "Toolbox/README.md",
            ],
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)
