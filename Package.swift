// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "adMobSwiftUI",
    platforms: [
        .iOS(.v17) // v18 pourrait ne pas être supporté par Xcode 16.2, reste sur v17 pour l'instant
    ],
    products: [
        .library(name: "adMobSwiftUI", targets: ["adMobSwiftUI"])
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "12.0.0")
    ],
    targets: [
        .target(
            name: "adMobSwiftUI",
            dependencies: [
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
            ],
            path: "adMobSwiftUI"
        ),
        .testTarget(
            name: "adMobSwiftUITests",
            dependencies: ["adMobSwiftUI"],
            path: "adMobSwiftUI"
        )
    ]
)