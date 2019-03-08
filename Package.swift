// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "Bitter",
    products: [
        .library(
            name: "Bitter", 
            targets: ["Bitter"]
        ),
    ],
    targets: [
        .target(
            name: "Bitter", 
            dependencies: []
        ),
        .testTarget(
            name: "BitterTests", 
            dependencies: ["Bitter"]
        )
    ]
)
