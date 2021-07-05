// swift-tools-version:5.2
import PackageDescription

let package = Package(
  name: "ragnarok",
  
  platforms: [
    .macOS(.v10_15)
  ],
  
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
    .package(url: "https://github.com/SwifQL/MySQLBridge.git", from:"1.0.0-rc"),
    .package(url: "https://github.com/SwifQL/VaporBridges.git", from:"1.0.0-rc")
  ],
  
  targets: [
    .target(
      name: "App",
      dependencies: [
        .product(name: "Vapor", package: "vapor"),
        .product(name: "MySQLBridge", package: "MySQLBridge"),
        .product(name: "VaporBridges", package: "VaporBridges")
      ],
      
      swiftSettings: [
        .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
      ]
    ),
    .target(name: "Run", dependencies: [.target(name: "App")]),
    
    .testTarget(name: "AppTests", dependencies: [
      .target(name: "App"),
      .product(name: "XCTVapor", package: "vapor"),
    ])
  ]
)
