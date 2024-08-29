//
//  LaunchView.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 15.08.2024.
//

import SwiftUI

private typealias Module = LaunchModule
private typealias ModuleView = Module.MainView

// MARK: - MainView
extension Module {
    struct MainView<ViewModel: ViewModelProtocol>: View {
        // MARK: - Dependencies
        @StateObject var viewModel: ViewModel
        @EnvironmentObject var navigator: AppFlowNavigator
        
        // MARK: - Private Properties
        @State private var needsToOpenNextScreen: Bool = false

        // MARK: - Body
        var body: some View {
            content()
                .onAppear(perform: self.viewModel.onAppear)
                .onChange(of: self.viewModel.needsToOpenNextScreen) { value in
                    guard value else { return }

                    self.openNextScreen(value)
                }
        }
    }
}

// MARK: - Private Layout
private extension ModuleView {
    @ViewBuilder func content() -> some View {
        ZStack {
            Color(AppColors.primaryColor.colorSwiftUI)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(AppAssets.launchLogo.name)
            }
        }
    }
}

// MARK: - Private Methods
private extension ModuleView {
    func openNextScreen(_ value: Bool) {
        withAnimation(.linear(duration: 0.4)) {
            self.needsToOpenNextScreen = value
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.navigator.routes = [.root(.tabBar)]
        }
    }
}

// MARK: - Previews
#if !RELEASE
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchModule().assemble()
            .previewDevice(.iPhone15Pro)
    }
}
#endif
