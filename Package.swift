// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PagoApiClient",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PagoApiClient",
            targets: ["PagoNetworkSPM"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/PagoApp/ios-core-spm", branch: "main"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "PagoApiClient",
            url: "https://github.com/PagoApp/ios-network-spm/releases/download/0.0.1/PagoApiClient.xcframework.zip",
            checksum: "752c0a6d0327673ce19ea76f1a9c86e97a2e885e32c91f0a9000fb4d45b39e91"
        ),
        .target(
            name: "PagoNetworkSPM",
            dependencies: [
                .target(name: "PagoApiClient"),
                .product(name: "PagoCoreSDK", package: "ios-core-spm")
            ]),
        .testTarget(
            name: "PagoNetworkSPMTests",
            dependencies: ["PagoNetworkSPM"]),
    ]
)
