//
//  UsersListRowView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import SwiftUI

// private typealias Localization = AppLocale.Users
private typealias Module = UsersModule
private typealias CurrentView = Module.UsersListRowView

extension Module {
    struct UsersListRowView: View {
        // MARK: - Public Properties
        let model: UsersModel

        // MARK: - Private Properties

        // MARK: - Body
        var body: some View {
            content()
//                .padding(16)
//                .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack {
            HStack(alignment: .top) {
                Image(model.photo)
                    .resizable()
                    .frame(width: 50, height: 50)
                
                VStack(spacing: 12) {
                    Text(model.name)
                    Text(model.position)
                    Text(model.email)
                    Text(model.phone)
                }
            }
        }
    }
}

// MARK: - Private Methods
private extension CurrentView {
}

// MARK: - Previews
#if !RELEASE
struct UsersListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CurrentView(model: .init(
                id: 1,
                name: "",
                email: "",
                phone: "",
                position_id: 1,
                position: "",
                photo: ""
            ))
        }
        .background(.gray)
    }
}
#endif
