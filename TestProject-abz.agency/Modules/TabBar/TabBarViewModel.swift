//
//  TabBarViewModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 24.08.2024.
//

import Foundation
import SwiftUI
//import Utility

private typealias Module = TabBarModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        @Published var selectedTab: TabKeys = .users
        @Published var errorToastData: (text: String, binding: Binding<Bool>) = ("", .constant(false))
        @Published var isLoading: Bool = false

        // MARK: - Private Properties

        // MARK: - Services
        // private let statisticsRepository: StatisticsRepositoryProtocol
        // private let toastsRepository: ToastsRepositoryProtocol

        // MARK: - Managers

        // MARK: - Helpers
        private var cancellable: CancelBag = .init()

        // MARK: - Init
        init(
            // statisticsRepository: StatisticsRepositoryProtocol,
            // toastsRepository: ToastsRepositoryProtocol
        ) {
            // self.statisticsRepository = statisticsRepository
            // self.toastsRepository = toastsRepository
        }

        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
            setupBinding()

//            Task(priority: .utility) { [weak self] in
//                try await self?.fetchStatisticsData()
//            } catch: { [weak self] error in
//                self?.toastsRepository.send(error.localizedDescription)
//            }
        }

        // MARK: - Tap Actions
    }
}

// MARK: - Private Methods
private extension ViewModel {
    func setupBinding() {
//        self.toastsRepository.errorText
//            .receive(on: RunLoop.main)
//            .assign(to: &$errorToastData)
    }

    func fetchStatisticsData() async throws {
        await MainActor.run {
            isLoading = true
        }
        do {
            // try await self.statisticsRepository.getStatistics()
            await MainActor.run {
                isLoading = false
            }
        } catch {
            await MainActor.run {
                isLoading = false
            }
            throw error
        }
    }
}
