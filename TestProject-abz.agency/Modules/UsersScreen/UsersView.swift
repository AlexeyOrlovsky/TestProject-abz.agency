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
        Module.UsersListView(models: [
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
            )
        ])
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
