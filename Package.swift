// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "manifold",
    platforms: [
        .macOS(.v11), .iOS(.v13)
    ],
    products: [
        .library(
            name: "manifold",
            targets: ["manifold"])
    ],
    dependencies: [
        .package(url: "https://github.com/audulus/Clipper2", branch: "spm"),
    ],
    targets: [
        .target(
            name: "manifold",
            dependencies: ["Clipper2"],
            path: ".",
            exclude: ["src/meshIO", "src/CMakeLists.txt"],
            sources: ["src"],
            publicHeadersPath: "include",
            cxxSettings: [
                .define("MANIFOLD_PAR", to: "-1"),
                .unsafeFlags(["-Wno-shorten-64-to-32"])
            ]
        )
    ],
    cxxLanguageStandard: .cxx20
)
