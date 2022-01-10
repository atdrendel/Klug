// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Klug",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(name: "Klug", targets: ["Klug"]),
        .library(name: "KlugHelpers", targets: ["KlugHelpers"]),
        .library(name: "HabitTrackerButtons", targets: ["HabitTrackerButtons"]),
        .library(name: "Animation", targets: ["Animation"]),
        .library(name: "Accessibility", targets: ["Accessibility"]),
        .library(name: "StateManagment", targets: ["StateManagment"]),
        .library(name: "Nett", targets: ["Nett"]),
        .library(name: "Relative", targets: ["Relative"]),
        
        // Point Free Inspiration
        .library(name: "AppFeature", targets: ["AppFeature"]),
        .library(name: "InventoryFeature", targets: ["InventoryFeature"]),
        .library(name: "ItemFeature", targets: ["ItemFeature"]),
        .library(name: "ItemRowFeature", targets: ["ItemRowFeature"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "ParsingHelpers", targets: ["ParsingHelpers"]),
        .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"])
        // Point Free Inspiration
    ],
    dependencies: [
        //   .package(name: "Relative", path: "../../Relative")
//        .package(url: "https://github.com/codebendr-product-designer/Relative", from: "develop")
        .package(url: "https://github.com/pointfreeco/swift-case-paths", from: "0.7.0"),
        .package(url: "https://github.com/pointfreeco/swift-identified-collections", from: "0.3.2"),
        .package(url: "https://github.com/pointfreeco/swift-parsing", from: "0.4.0")
    ],
    targets: [
        .target(name: "Nett", dependencies: [
            "Relative"
        ]),
        .target(name: "Relative"),
        
        .target(name: "StateManagment"),
        
        .target(name: "Accessibility"),
        
        .target(name: "Klug", dependencies: [
            "Accessibility",
            "KlugHelpers"
        ]),
        
        .target(name: "KlugHelpers"),
        
        .target(name: "HabitTrackerButtons"),
        
        .target(name: "Animation"),
        
        // Point Free Inspiration
        .target(name: "Models"),
        .target(name: "AppFeature",
                dependencies: [
                    "InventoryFeature",
                    "Models",
                    "ParsingHelpers",
                    .product(name: "Parsing", package: "swift-parsing")
                ]),
        .target(name: "InventoryFeature",
                dependencies: [
                    "ItemRowFeature",
                    "Models",
                    "ParsingHelpers",
                    "SwiftUIHelpers",
                    .product(name: "CasePaths", package: "swift-case-paths"),
                    .product(name: "IdentifiedCollections", package: "swift-identified-collections"),
                    .product(name: "Parsing", package: "swift-parsing")
                ]),
        .target(name: "ItemFeature",
                dependencies: [
                    "Models",
                    "SwiftUIHelpers",
                    .product(name: "CasePaths", package: "swift-case-paths")
                ]),
        .target(name: "ItemRowFeature",
                dependencies: [
                    "ItemFeature",
                    "Models",
                    "SwiftUIHelpers",
                    "ParsingHelpers",
                    .product(name: "CasePaths", package: "swift-case-paths"),
                    .product(name: "Parsing", package: "swift-parsing")
                ]),
        .target(name: "SwiftUIHelpers",
                dependencies: [
                    .product(name: "CasePaths", package: "swift-case-paths")
                ]),
        .target(name: "ParsingHelpers",
                dependencies: [
                    .product(name: "Parsing", package: "swift-parsing")
                ]),
        .testTarget(name: "NavigationTests",
                    dependencies: [
                        "InventoryFeature",
                        "ItemRowFeature",
                        "Models"
                    ])
        // Point Free Inspiration
    ]
)
