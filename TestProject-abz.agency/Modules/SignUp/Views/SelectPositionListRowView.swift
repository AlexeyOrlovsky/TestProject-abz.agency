//
//  SelectPositionListRowView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 25.08.2024.
//

import SwiftUI

private typealias Module = SignUpModule
private typealias CurrentView = Module.ListRowView

extension Module {
    struct ListRowView: View {
        // MARK: - Public Properties
        let item: String// LocalizeManager.Localize
        let isSelected: Bool
        let didTap: () -> Void


        // MARK: - Body
        var body: some View {
            content()
                .frame(height: 48)
                .frame(maxWidth: .infinity)
                .padding([.leading, .trailing], 8)
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        Button {
            didTap()
        } label: {
            HStack(spacing: 8) {
                radioButtonView()
                textView()
                Spacer()
            }
        }
    }

    @ViewBuilder func radioButtonView() -> some View {
        VStack {
            if isSelected {
                Circle()
                    .strokeBorder(.cyan, lineWidth: 6)
                    .background(Circle()
                        .foregroundColor(Color.clear)
//                        .overlay {
//                            Circle()
//                                .foregroundColor(.blue)
//                                .frame(width: 10, height: 10)
//                        }
                    )
            } else {
                Circle()
                    .strokeBorder(.gray, lineWidth: 2)
            }
        }
        .frame(width: 20, height: 20)
        .padding(4)
    }

    @ViewBuilder func textView() -> some View {
        Text(item)
            // .appFontRegularSize16()
            .font(.body)
            .foregroundStyle(.black)
    }
}

// MARK: - Previews
#if !RELEASE
struct ChooseLanguageListRowView_Previews: PreviewProvider {
    // @Defaults(\.navigationAccentColor) static private var navigationAccentColor
    @State static var navigationPanelButtonState: TextFieldStates = .default

    static var previews: some View {
        VStack {
            CurrentView(
                item: "Frontend developer",
                isSelected: true,
                didTap: { }
            )
            CurrentView(
                item: "Backend developer",
                isSelected: false,
                didTap: { }
            )
            CurrentView(
                item: "Designer",
                isSelected: false,
                didTap: { }
            )
            CurrentView(
                item: "QA",
                isSelected: false,
                didTap: { }
            )
        }
        .padding()
        .previewDevice(.iPhone15Pro)
    }
}
#endif

