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
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.assemble()
        }
    }
}
