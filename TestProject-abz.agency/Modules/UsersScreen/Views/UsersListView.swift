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
                    // .fill(AppColors.listSeparator.colorSwiftUI)
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
                    name: "",
                    email: "",
                    phone: "",
                    position_id: 1,
                    position: "",
                    photo: ""
                ),
                .init(
                    id: 1,
                    name: "",
                    email: "",
                    phone: "",
                    position_id: 1,
                    position: "",
                    photo: ""
                )
            ]
            // fetchNextPage: { }
        )
        .background(.gray)

//        CurrentView( // swiftlint:disable:this trailing_closure
//            models: [
//                .init(
//                    id: "1",
//                    payStatus: .paid,
//                    licensePlate: "AA1010AA",
//                    gantries: .init(
//                        firstGantry: "Gantry 1",
//                        secondGantry: "Gantry 2"
//                    ),
//                    startDate: "2024-02-29T15:32:24.000000Z",
//                    endDate: "2024-02-29T18:22:18.000000Z",
//                    price: 0.0093,
//                    distance: 2
//                ),
//                .init(
//                    id: "2",
//                    payStatus: .paid,
//                    licensePlate: "AA1010AA",
//                    gantries: .init(
//                        firstGantry: "Gantry 1",
//                        secondGantry: "Gantry 2"
//                    ),
//                    startDate: "2024-02-29T15:32:24.000000Z",
//                    endDate: "2024-02-29T18:22:18.000000Z",
//                    price: 0.0093,
//                    distance: 2
//                )
//            ],
//            fetchNextPage: { }
//        )
    }
}
#endif
