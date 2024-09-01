//
//  Text+Appearance.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 28.08.2024.
//

import SwiftUI

extension Text {
    // MARK: - Regular
    public func appFontRegularSize12() -> Text {
        self.font(buildRegular(size: 12))
    }
    
    public func appFontRegularSize14() -> Text {
        self.font(buildRegular(size: 14))
    }

    public func appFontRegularSize16() -> Text {
        self.font(buildRegular(size: 16))
    }

    public func appFontRegularSize18() -> Text {
        self.font(buildRegular(size: 18))
    }

    public func appFontRegularSize20() -> Text {
        self.font(buildRegular(size: 20))
    }
    
    // MARK: - Semi Bold
    public func appFontSemiBoldSize16() -> Text {
        self.font(buildSemiBold(size: 16))
    }
    
    public func appFontSemiBoldSize18() -> Text {
        self.font(buildSemiBold(size: 18))
    }
}

// MARK: - Private Methods
private extension Text {
    // MARK: - Regular
    /// Weight 400
    func buildRegular(size: CGFloat) -> Font {
        AppFonts.Nunito.regular.fontSwiftUI(size: size)
    }
    
    // MARK: - Semi Bold
    /// Weight 600
    func buildSemiBold(size: CGFloat) -> Font {
        AppFonts.Nunito.semiBold.fontSwiftUI(size: size)
    }
}
