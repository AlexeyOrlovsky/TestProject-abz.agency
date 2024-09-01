//
//  TestProject_abz_agencyApp.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 15.08.2024.
//

import SwiftUI

@main
struct TestProjectApp: App {
    
    // MARK: - Dependencies
    @Inject(\.appCoordinator) var appCoordinator
    // @Inject(\.tabBarModule) var tabBarModule // for tests
    
    var body: some Scene {
        WindowGroup {
            // tabBarModule.assemble()
            appCoordinator.assemble()
                .onAppear {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        windowScene.windows.forEach { window in
                            window.overrideUserInterfaceStyle = .light
                        }
                    }
                }
        }
    }
}
