import PackageDescription

let package = Package(
    name: "Bitter",
    targets: [
        Target(name: "BitterTests", dependencies: [.Target(name: "Bitter")])
    ]
)
