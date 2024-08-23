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
                .padding(16)
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack {
            HStack(alignment: .top, spacing: 24) {
                Image(systemName: model.photo)
                    .resizable()
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 12) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(model.name)
                            .font(.title2)
                        Text(model.position)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(model.email)
                        Text(model.phone)
                    }
                }
                
                Spacer()
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
            CurrentView(
                model: .init(
                    id: 1,
                    name: "Akela Versale",
                    email: "morrterry@gmail.com",
                    phone: "+36 (087) 849 37 34",
                    position_id: 1,
                    position: "Frontend Developer",
                    photo: "person.fill"
                )
            )
            .padding()
        }
        .previewDevice(.iPhone15Pro)
    }
}
#endif
