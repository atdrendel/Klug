// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Klug",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Klug", targets: ["Klug"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "ParsingHelpers", targets: ["ParsingHelpers"]),
        .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"]),
        .library(name: "ItemFeature", targets: ["ItemFeature"])
        
    ],
    dependencies: [
        //   .package(name: "Relative", path: "../../Relative")
        .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.7.0"),
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.4.0")
    ],
    targets: [
        .target(name: "Klug"),
        .target(name: "Models"),
        .target(name: "ItemFeature",
                dependencies: [
                    "Models",
                    "SwiftUIHelpers",
                    .product(name: "CasePaths", package: "swift-case-paths")
                ]),
        .target(name: "SwiftUIHelpers",
                dependencies: [
                    .product(name: "CasePaths", package: "swift-case-paths")
                ]),
        .target(name: "ParsingHelpers",
                dependencies: [
                    .product(name: "Parsing", package: "swift-parsing")
                ])
    ]
)
