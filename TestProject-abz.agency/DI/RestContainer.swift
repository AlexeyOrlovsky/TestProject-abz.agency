//
//  RestContainer.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 15.08.2024.
//

import Foundation
import Factory

extension Container: AutoRegistering {
    public func autoRegister() {
        manager.defaultScope = .singleton
    }

    // MARK: - Coordinator
    var appRoutes: Factory<AppRoutes> {
        self { .init() }
    }

    var appCoordinator: Factory<AppCoordinatorModule> {
        self { .init() }
    }

    // MARK: - Modules
    var launchModule: Factory<LaunchModule> {
        self { .init() }
    }
    
    var tabBarModule: Factory<TabBarModule> {
        self { .init() }
    }
    
    var noConnectionModule: Factory<NoConnectionModule> {
        self { .init() }
    }
    
    var signUpSuccessModule: Factory<SuccessModule> {
        self { .init() }
    }
    
    var signUpFailedModule: Factory<FailedModule> {
        self { .init() }
    }
}

