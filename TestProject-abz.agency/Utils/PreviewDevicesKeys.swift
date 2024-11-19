//
//  PreviewDevicesKeys.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 23.08.2024.
//

import SwiftUI

#if !RELEASE
// swiftlint:disable all
public enum PreviewDevicesKeys: String, Hashable {
    // MARK: - iPhones Old
    case iPhone7 = "iPhone 7"
    case iPhone7Plus = "iPhone 7 Plus"
    case iPhone8 = "iPhone 8"
    case iPhone8Plus = "iPhone 8 Plus"

    // MARK: - iPhones SE
    case iPhoneSE = "iPhone SE"
    case iPhoneSE_3rd = "iPhone SE (3rd generation)"

    // MARK: - iPhone X and earlier
    case iPhoneX = "iPhone X"
    case iPhoneXs = "iPhone Xs"
    case iPhoneXsMax = "iPhone Xs Max"
    case iPhoneXR = "iPhone Xʀ"
    case iPhone14Pro = "iPhone 14 Pro"
    case iPhone15Pro = "iPhone 15 Pro"
    case iPhone15ProMax = "iPhone 15 Pro Max"

    // MARK: - iPads
    case iPadMini4 = "iPad mini 4"
    case iPadAir2 = "iPad Air 2"
    case iPadPro_9_7 = "iPad Pro (9.7-inch)"
    case iPadPro_12_9 = "iPad Pro (12.9-inch)"
    case iPad5 = "iPad (5th generation)"
    case iPadPro_12_9_2G = "iPad Pro (12.9-inch) (2nd generation)"
    case iPadPro_10_5 = "iPad Pro (10.5-inch)"
    case iPad6 = "iPad (6th generation)"
    case iPadPro_11 = "iPad Pro (11-inch)"
    case iPadPro_12_9_3G = "iPad Pro (12.9-inch) (3rd generation)"
    case iPadMini5 = "iPad mini (5th generation)"
    case iPadAir_3G = "iPad Air (3rd generation)"
    case AppleTV = "Apple TV"
    case AppleTV_4K = "Apple TV 4K"
    case AppleTV_4K1080P = "Apple TV 4K (at 1080p)"
    case AppleWatch2_38 = "Apple Watch Series 2 - 38mm"
    case AppleWatch2_42 = "Apple Watch Series 2 - 42mm"
    case AppleWatch3_38 = "Apple Watch Series 3 - 38mm"
    case AppleWatch3_42 = "Apple Watch Series 3 - 42mm"
    case AppleWatch4_40 = "Apple Watch Series 4 - 40mm"
    case AppleWatch4_44 = "Apple Watch Series 4 - 44mm"

    // MARK: - Macs
    case mac = "Mac"
}
// swiftlint:enable all

// MARK: - Priview device Extension
extension View {
    public func previewDevice(_ device: PreviewDevicesKeys) -> some View {
        self.previewDevice(.init(rawValue: device.rawValue))
    }
}
#endif

