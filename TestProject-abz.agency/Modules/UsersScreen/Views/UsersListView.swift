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
                .padding([.leading, .trailing], 16)
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
struct TravelHistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentView( // swiftlint:disable:this trailing_closure
            models: [
                .init(
                    id: 1,
                    name: "Akela Versale",
                    email: "morrterry@gmail.com",
                    phone: "+36 (087) 849 37 34",
                    position_id: 1,
                    position: "Frontend Developer",
                    photo: "person.fill"
                ),
                .init(
                    id: 2,
                    name: "Akela Versale",
                    email: "morrterry@gmail.com",
                    phone: "+36 (087) 849 37 34",
                    position_id: 2,
                    position: "Frontend Developer",
                    photo: "person.fill"
                ),
                .init(
                    id: 3,
                    name: "Akela Versale",
                    email: "morrterry@gmail.com",
                    phone: "+36 (087) 849 37 34",
                    position_id: 3,
                    position: "Frontend Developer",
                    photo: "person.fill"
                ),
                .init(
                    id: 4,
                    name: "Akela Versale",
                    email: "morrterry@gmail.com",
                    phone: "+36 (087) 849 37 34",
                    position_id: 4,
                    position: "Frontend Developer",
                    photo: "person.fill"
                )
            ]
            // fetchNextPage: { }
        )
        .previewDevice(.iPhone15Pro)
    }
}
#endif
