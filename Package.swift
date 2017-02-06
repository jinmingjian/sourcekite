import PackageDescription

let package = Package(
    name: "sourcekite",
    targets: [
        Target(name: "sourcekite", dependencies: ["sourcekitd"])
    ]
)
