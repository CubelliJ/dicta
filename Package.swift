// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Dicta",
    platforms: [.macOS(.v13)],
    products: [.executable(name: "Dicta", targets: ["Dicta"])],
    targets: [
        .executableTarget(name: "Dicta", path: "Dicta/Sources")
    ]
)
