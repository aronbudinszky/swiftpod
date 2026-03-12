// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "swiftpod",
    products: [
        .library(name: "SwiftPod", targets: ["SwiftPod"]),
        .library(name: "Clibgpod", targets: ["Clibgpod"]),
    ],
    targets: [
        .systemLibrary(
            name: "CGLib",
            pkgConfig: "glib-2.0",
            providers: [
                .brew(["glib"]),
                .apt(["libglib2.0-dev"]),
            ]
        ),
        .target(
            name: "Clibgpod",
            dependencies: ["CGLib"],
            path: "src",
            exclude: [
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
                .define("HAVE_CONFIG_H", to: "1"),
                .unsafeFlags([
                    // gobject-2.0
                    "-I/opt/homebrew/include",
                    "-I/opt/homebrew/include/glib-2.0",
                    "-I/opt/homebrew/lib/glib-2.0/include",
                    // libplist
                    "-I/opt/homebrew/include",
                    // libxml2
                    "-I/usr/include/libxml2",
                ]),
            ],
            linkerSettings: [
                .unsafeFlags([
                    "-L/opt/homebrew/lib",
                    "-lgobject-2.0",
                    "-lgmodule-2.0",
                    "-lglib-2.0",
                    "-lintl",
                    "-lplist-2.0",
                    "-lsqlite3",
                    "-lxml2",
                    "-lz",
                    "-lm",
                ]),
            ]
        ),
        .target(
            name: "SwiftPod",
            dependencies: ["Clibgpod"],
            path: "Sources/SwiftPod"
        ),
    ]
)
