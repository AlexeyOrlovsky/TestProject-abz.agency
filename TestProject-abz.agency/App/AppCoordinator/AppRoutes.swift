//
//  AppRoutes.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 15.08.2024.
//

import Foundation
import FlowStacks

final class AppRoutes: ObservableObject {
    @Published var routes: Routes<AppScreens> = [.root(.launch)]
}
