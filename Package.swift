// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "UIKitTheme",
	products: [
		.library(name: "UIKitTheme", targets: ["UIKitTheme"])
	],
	dependencies: [],
	targets: [
	.target(name: "UIKitTheme", dependencies: [], path: "Sources/Shared"),
		.testTarget(name: "UIKitThemeTests", dependencies: ["UIKitTheme"], path: "UIKitThemeTests/Shared")
	]
)
