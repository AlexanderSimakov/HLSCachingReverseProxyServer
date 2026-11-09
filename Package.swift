// swift-tools-version:5.1

import PackageDescription

let package = Package(
  name: "HLSCachingReverseProxyServer",
  platforms: [
    // GCDWebServer needs iOS 13 and macOS 10.15; PINCache needs tvOS 12.
    .macOS(.v10_15), .iOS(.v13), .tvOS(.v12)
  ],
  products: [
    .library(name: "HLSCachingReverseProxyServer", targets: ["HLSCachingReverseProxyServer"]),
  ],
  dependencies: [
    // The same libraries the podspec depends on. GCDWebServer comes from yene's
    // repository, which keeps the 3.5.x code and adds a Swift package.
    .package(url: "https://github.com/yene/GCDWebServer.git", .upToNextMajor(from: "3.5.7")),
    .package(url: "https://github.com/pinterest/PINCache.git", .upToNextMajor(from: "3.0.4")),
    .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "9.0.0")),
    .package(url: "https://github.com/devxoul/SafeCollection.git", .upToNextMajor(from: "3.1.0")),
  ],
  targets: [
    .target(name: "HLSCachingReverseProxyServer", dependencies: ["GCDWebServer", "PINCache"]),
    .testTarget(name: "HLSCachingReverseProxyServerTests", dependencies: ["HLSCachingReverseProxyServer", "Nimble", "SafeCollection"]),
  ]
)
