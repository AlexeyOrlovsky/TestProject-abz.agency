// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum AppAssets {
    public static let launchLogo = ImageAsset(name: "Launch.logo")
    public static let close = ImageAsset(name: "close")
    public static let noInternetConnection = ImageAsset(name: "noInternetConnection")
    public static let signUpFailed = ImageAsset(name: "signUpFailed")
    public static let signUpSuccess = ImageAsset(name: "signUpSuccess")
    public static let usersEmpty = ImageAsset(name: "UsersEmpty")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ImageAsset {
    public fileprivate(set) var name: String

    #if os(macOS)
    public typealias Image = NSImage
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    public typealias Image = UIImage
    #endif

    public init(name: String) {
        self.name = name
    }

    public var imageOptional: Image? {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
        let image = Image(named: name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        let name = NSImage.Name(self.name)
        let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
        #elseif os(watchOS)
        let image = Image(named: name)
        #endif
        return image
    }
    public var image: Image {
        return imageOptional ?? UIImage()
    }
}

public extension ImageAsset.Image {
    @available(macOS, deprecated,
        message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
    convenience init?(asset: ImageAsset) {
        #if os(iOS) || os(tvOS)
        let bundle = BundleToken.bundle
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        self.init(named: NSImage.Name(asset.name))
        #elseif os(watchOS)
        self.init(named: asset.name)
        #endif
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: BundleToken.self)
        #endif
    }()
}
// swiftlint:enable convenience_type
// swiftlint:enable all
