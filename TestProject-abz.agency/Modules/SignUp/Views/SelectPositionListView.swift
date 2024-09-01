//
//  SelectPositionListView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 25.08.2024.
//

import SwiftUI

private typealias Localization = AppLocale.SignUp
private typealias Module = SignUpModule
private typealias CurrentView = Module.ListView

extension Module {
    struct ListView: View {
        // MARK: - Public Properties
        let localizations: [String]
        let selectedIndex: (Int) -> Void
        var state: TextFieldStates

        // MARK: - Private Properties
        @State private var _selectedIndex: Int = .zero

        // MARK: - Body
        var body: some View {
            content()
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack(spacing: 8) {
            ForEachWithIndex(localizations) { index, item in
                Module.ListRowView(
                    item: item,
                    isSelected: self._selectedIndex == index
                ) {
                    self._selectedIndex = index
                    selectedIndex(index)
                }
            }
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct ChooseLanguageListView_Previews: PreviewProvider {
    // @Defaults(\.navigationAccentColor) static private var navigationAccentColor

    @State static private var isSelected: Int = .zero
    @State static private var state: TextFieldStates = .default

    static var previews: some View {
        VStack {
            CurrentView(localizations: [
                Localization.Position.frontend,
                Localization.Position.backend,
                Localization.Position.designer,
                Localization.Position.qa
            ], selectedIndex: { index in
                debugPrint("\(index)")
            }, state: state)
        }
        .padding()
        .previewDevice(.iPhone15Pro)
    }
}
#endif

