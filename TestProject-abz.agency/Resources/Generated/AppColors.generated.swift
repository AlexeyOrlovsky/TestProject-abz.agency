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
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetColorTypeAlias = ColorAsset.Color

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum AppColors {
    public static let separatorColor = ColorAsset(name: "SeparatorColor")
    public static let primaryColor = ColorAsset(name: "PrimaryColor")
    public static let secondaryColor = ColorAsset(name: "SecondaryColor")
    public static let textBlack = ColorAsset(name: "TextBlack")
    public static let textPrimary = ColorAsset(name: "TextPrimary")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class ColorAsset {
    public fileprivate(set) var name: String

    #if os(macOS)
    public typealias Color = NSColor
    #elseif os(iOS) || os(tvOS) || os(watchOS)
    public typealias Color = UIColor
    #endif
    #if canImport(SwiftUI)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public typealias ColorSwiftUI = SwiftUI.Color
    #endif

    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    public private(set) lazy var color: Color = {
        guard let color = Color(asset: self) else {
        fatalError("Unable to load color asset named \(name).")
        }
        return color
    }()

    #if compiler(>=5.5)
    @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
    public private(set) lazy var colorSwiftUI: ColorSwiftUI = {
        ColorSwiftUI(self.color)
    }()
    #endif

    fileprivate init(name: String) {
        self.name = name
    }
}

public extension ColorAsset.Color {
    @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
    convenience init?(asset: ColorAsset) {
        let bundle = BundleToken.bundle
        #if os(iOS) || os(tvOS)
        self.init(named: asset.name, in: bundle, compatibleWith: nil)
        #elseif os(macOS)
        self.init(named: NSColor.Name(asset.name), bundle: bundle)
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
