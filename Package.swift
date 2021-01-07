// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RefreshList",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "RefreshList",
            targets: ["RefreshList"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Introspect", url: "https://github.com/siteline/SwiftUI-Introspect.git", from: "0.1.0"),
        .package(name: "ActionClosurable", url: "https://github.com/takasek/ActionClosurable.git", from: "2.1.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "RefreshList",
            dependencies: ["Introspect","ActionClosurable"])
    ]
)
