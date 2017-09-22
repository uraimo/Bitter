import PackageDescription

let package = Package(
    name: "Bitter",
    targets: [
        Target(name: "Bitter", dependencies: []),
        Target(name: "BitterTests", dependencies: ["Bitter"])
    ]
)
