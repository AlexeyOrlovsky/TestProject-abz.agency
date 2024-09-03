//
//  UsersListRowView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import SwiftUI

private typealias Module = UsersModule
private typealias CurrentView = Module.UsersListRowView

extension Module {
    struct UsersListRowView: View {
        // MARK: - Public Properties
        let model: UserModel
        
        // MARK: - Private Properties
        private let textColor = Color(.textBlack)
        
        // MARK: - Body
        var body: some View {
            content()
                .padding([.leading, .trailing], 16)
                .padding([.top, .bottom], 24)
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack {
            HStack(alignment: .top, spacing: 24) {
                iconView()
                VStack(alignment: .leading, spacing: 8) {
                    userInfoView()
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder func iconView() -> some View {
        if let url = URL(string: model.photo) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    iconSetup(image)
                case .failure:
                    iconSetup(Image(systemName: "person"))
                @unknown default:
                    Image(systemName: "person")
                }
            }
        } else {
            Text("Invalid URL")
        }
    }
    
    @ViewBuilder func iconSetup(_ image: Image) -> some View {
        image
            .resizable()
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
    
    @ViewBuilder func userInfoView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.name)
                .appFontRegularSize18()
                .foregroundStyle(textColor)
            Text(model.position)
                .appFontRegularSize14()
                .foregroundColor(.textPrimary)
        }
        
        VStack(alignment: .leading, spacing: 4) {
            Text(model.email)
                .appFontRegularSize14()
                .foregroundStyle(textColor)
                .lineLimit(1)
            Text(model.phone)
                .appFontRegularSize14()
                .foregroundStyle(textColor)
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct UsersListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CurrentView(
                model: .init(
                    id: 1,
                    name: "Malcolm Bailey",
                    email: "jany_murazik51@hotmail.com",
                    phone: "+38 (098) 278 76 24",
                    position_id: 1,
                    position: "Frontend developer",
                    photo: "person.fill"
                )
            )
            .padding()
        }
        .previewDevice(.iPhone15Pro)
    }
}
#endif
