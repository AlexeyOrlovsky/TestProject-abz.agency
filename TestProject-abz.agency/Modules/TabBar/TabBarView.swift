//
//  TabBarView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 24.08.2024.
//

import SwiftUI

private typealias Module = TabBarModule
private typealias ModuleView = Module.MainView

// MARK: - MainView
extension Module {
    struct MainView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator

        // MARK: - Screens
        private let usersModule: UsersModule

        // MARK: - Init
        init(viewModel: ViewModel, usersModule: UsersModule) {
            self._viewModel = .init(wrappedValue: viewModel)
            self.usersModule = usersModule

            configureTabBar()
        }

        private func configureTabBar() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()

            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }

        // MARK: - Body
        var body: some View {
            rootContent()
                .onAppear(perform: self.viewModel.onAppear)
//                .modifier(ToasterViewModifier.errorView(
//                    text: self.viewModel.errorToastData.text,
//                    showToast: self.viewModel.errorToastData.binding)
//                )
//                .loadingModifier(isLoading: self.viewModel.isLoading)
        }
    }
}

// MARK: - Private Layout
private extension ModuleView {
    @ViewBuilder func rootContent() -> some View {
//        if #available(iOS 18.0, *) {
//            newContent()
//        } else {
            content()
//        }
    }

//    #if swift(>=5.9)
//    @available(iOS 18.0, *)
//    @ViewBuilder func newContent() -> some View {
//        TabView {
//            Tab {
//                self.usersModule.assemble()
//            } label: {
//                tabItem(key: .users)
//            }
//
//            Tab {
//                self.signUpModule.assemble()
//            } label: {
//                tabItem(key: .signUp)
//            }
//        }
//        .tint(AppColors.primary.colorSwiftUI)
//        .tabViewStyle(.sidebarAdaptable)
//    }
//    #endif

    @ViewBuilder func content() -> some View {
        VStack {
            TabView(selection: $viewModel.selectedTab) {
                self.usersModule.assemble { input in
                    input.configure(.init())
                    return viewModel as? UsersModule.ModuleOutput
                }
                .tabItem { tabItem(key: .users) }
//                self.signUpModule.assemble()
//                    .tabItem { tabItem(key: .signUp) }
            }
            .accentColor(.cyan)
        }
    }

    @ViewBuilder func tabItem(key: Module.TabKeys) -> some View {
        Group {
            Text(key.title)
            Image(uiImage: key.image)
        }
    }
}

// MARK: - Private Methods
private extension ModuleView {
}

// MARK: - Previews
#if !RELEASE
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarModule().assemble()
    }
}
#endif
