//
//  UsersListView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 23.08.2024.
//

import SwiftUI

private typealias Module = UsersModule
private typealias CurrentView = Module.UsersListView

extension Module {
    struct UsersListView: View {
        // MARK: - Public Properties
        var models: [UsersModel]
        // var fetchNextPage: () -> Void

        // MARK: - Private Properties

        // MARK: - Body
        var body: some View {
            content()
                .padding(.top, 40)
                .padding(.leading, 8)
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        List(models) { model in
            self.rowView(model: model)
                .onAppear {
                    guard model == models.last else { return }

                    // fetchNextPage()
                }
                .listRowSeparator(.hidden, edges: .all)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets())
        }
        .scrollIndicators(.hidden)
        .safeAreaInset(edge: .bottom) {
            Spacer()
                .frame(height: 32)
        }
        .listStyle(.plain)
        .cornerRadius(12)
        .clipped()
        // .backgroundWhiteRoundedRectangle(corners: [.topLeft, .topRight])
        .ignoresSafeArea()

    }

    @ViewBuilder func rowView(model: UsersModule.UsersModel) -> some View {
        VStack(spacing: .zero) {
            Module.UsersListRowView(model: model)
            if model != models.last {
                Rectangle()
                    .fill(.gray)
                    .padding(.leading, 84)
                    .frame(maxWidth: .infinity)
                    .frame(height: 1)
            }
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView( // swiftlint:disable:this trailing_closure
            models: [
                .init(
                    id: 1,
                    name: "Malcolm Bailey",
                    email: "jany_murazik51@hotmail.com",
                    phone: "+38 (098) 278 76 24",
                    position_id: 1,
                    position: "Frontend developer",
                    photo: "person.fill"
                ),
                .init(
                    id: 2,
                    name: "Seraphina Anastasia Isolde Aurelia Celestina von Hohenzollern",
                    email: "maximus_wilderman_ronaldo_schuppe@gmail.com",
                    phone: "+38 (098) 278 76 24",
                    position_id: 2,
                    position: "Backend developer",
                    photo: "person.fill"
                ),
                .init(
                    id: 3,
                    name: "Gayle Weimann",
                    email: "kenyatta.herman@hotmail.com",
                    phone: "+38 (098) 278 76 24",
                    position_id: 3,
                    position: "Designer",
                    photo: "person.fill"
                ),
                .init(
                    id: 4,
                    name: "Rochelle Bartoletti Melba Satterfield",
                    email: "georgette_powlowski24@hotmail.com",
                    phone: "+38 (098) 278 76 24",
                    position_id: 4,
                    position: "QA",
                    photo: "person.fill"
                ),
                .init(
                    id: 5,
                    name: "Leland Cartwright",
                    email: "maymie_marvin0@gmail.com",
                    phone: "+38 (098) 278 76 24",
                    position_id: 5,
                    position: "Backend developer",
                    photo: "person.fill"
                ),
                .init(
                    id: 6,
                    name: "Debra Cassin",
                    email: "camylle35@hotmail.com",
                    phone: "+38 (098) 278 76 24",
                    position_id: 6,
                    position: "Frontend developer",
                    photo: "person.fill"
                )
            ]
            // fetchNextPage: { }
        )
        .previewDevice(.iPhone15Pro)
    }
}
#endif
