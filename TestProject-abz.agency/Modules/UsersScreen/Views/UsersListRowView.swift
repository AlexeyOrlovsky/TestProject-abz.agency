//
//  UsersListRowView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import SwiftUI

// private typealias Localization = AppLocale.Users
private typealias Module = UsersModule
private typealias CurrentView = Module.TravelHistoryListRowView

extension Module {
    struct TravelHistoryListRowView: View {
        // MARK: - Public Properties
        let model: HistoryModel

        // MARK: - Private Properties

        // MARK: - Body
        var body: some View {
            content()
                .padding(16)
                .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Private Layout
private extension CurrentView {
    @ViewBuilder func content() -> some View {
        VStack(alignment: .leading, spacing: 8) {
        }
    }
}

// MARK: - Private Methods
private extension CurrentView {
}

// MARK: - Previews
#if !RELEASE
struct TravelHistoryListRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
//            CurrentView(model: .init(
//                id: "1",
//                payStatus: .paid,
//                licensePlate: "AA1010AA",
//                gantries: .init(
//                    firstGantry: "Gantry 1",
//                    secondGantry: "Gantry 2"
//                ),
//                startDate: "2024-02-29T15:32:24.000000Z",
//                endDate: "2024-02-29T18:22:18.000000Z",
//                price: 0.0093,
//                distance: 2
//            ))
        }
        .background(.gray)
    }
}
#endif

