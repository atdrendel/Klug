// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Klug",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Klug", targets: ["Klug"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"])

    ],
    dependencies: [
        //   .package(name: "Relative", path: "../../Relative")
        .package(url: "https://github.com/pointfree/swift-case-paths", from: "0.7.0")
    ],
    targets: [
        .target(name: "Klug"),
        .target(name: "Models"),
        .target(name: "SwiftUIHelpers",
                dependencies: [
                    .product(name: "CasePaths", package: "swift-case-paths")
                ])
    ]
)
