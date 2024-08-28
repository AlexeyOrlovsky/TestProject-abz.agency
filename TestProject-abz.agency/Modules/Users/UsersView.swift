//
//  UsersView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import SwiftUI

private typealias Module = UsersModule
private typealias ModuleView = Module.MainView

// MARK: - MainView
extension Module {
    struct MainView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator
        
        // MARK: - Body
        var body: some View {
            content()
                .onAppear(perform: self.viewModel.onAppear)
        }
    }
}

// MARK: - Private Layout
private extension ModuleView {
    @ViewBuilder func content() -> some View {
        switch self.viewModel.uiState {
        case .empty:
            Module.UsersEmptyView()
        case .withData:
            Module.UsersListView(
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
                ])
        }
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersModule().assemble()
            .previewDevice(.iPhone15Pro)
    }
}
#endif
