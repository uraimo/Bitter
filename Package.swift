import PackageDescription

let package = Package(
    name: "BitterSwift",
    targets: [
        Target(name: "BitterSwiftTests", dependencies: [.Target(name: "BitterSwift")])
    ]
)
