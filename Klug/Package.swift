// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Klug",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Klug", targets: ["Klug"]),
        .library(name: "Models", targets: ["Models"])
            
    ],
    dependencies: [
     //   .package(name: "Relative", path: "../../Relative")
    ],
    targets: [
        .target(name: "Klug"),
        .target(name: "Models")
    ]
)
