//
//  UsersEmptyView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 28.08.2024.
//

import SwiftUI

private typealias Localization = AppLocale.Users
private typealias Module = UsersModule
private typealias CurrentView = Module.UsersEmptyView

extension Module {
    struct UsersEmptyView: View {
        // MARK: - Private Properties
        private let textColor = Color(.textBlack)
        
        // MARK: - Body
        var body: some View {
            content()
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        usersEmptyView()
            .padding(.top, 40)
            .padding([.leading, .trailing], 16)
    }
    
    @ViewBuilder func usersEmptyView() -> some View {
        VStack(spacing: 24) {
            Image(AppAssets.usersEmpty.name)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            Text(Localization.notYet)
                .appFontRegularSize20()
                .multilineTextAlignment(.center)
        }
        .padding()
        .padding(24)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Previews
#if !RELEASE
struct UsersEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView()
    }
}
#endif
