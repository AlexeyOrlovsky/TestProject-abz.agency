//
//  UsersViewModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 22.08.2024.
//

import Foundation

private typealias Module = UsersModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        private enum Constants {
            static let initialPage: Int = 1
            static let pageStep: Int = 1
            static let count: Int = 6
        }
        
        // MARK: - Public Properties
        @Published private(set) var uiState: TabState = .empty
        @Published private(set) var userModels: [UserModel] = []
        @Published private(set) var errorText: String = ""
        @Published private(set) var isLoadingNextPage = false
        
        // MARK: - Dependencies
        weak var moduleOutput: ModuleOutput?

        // MARK: - Private Properties
        private var currentPage = Constants.initialPage
        private var didAppeared: Bool = false

        // MARK: - Services
        private let usersService: UsersService

        // MARK: - Managers
        private let networkMonitor: NetworkMonitorProtocol

        // MARK: - Helpers
        private var cancellable: CancelBag = .init()

        // MARK: - Init
        init(
            usersService: UsersService,
            networkMonitor: NetworkMonitorProtocol
            
        ) {
            self.usersService = usersService
            self.networkMonitor = networkMonitor
        }

        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
            guard !didAppeared else { return }
            
            fetchInitData()
            self.didAppeared = true
        }
        
        // MARK: - ViewModelProtocol
        func fetchNextPage() {
            Task {
                let response = try await self.fetchHistory()
                let newUserModels = response.map { UserModel(from: $0) }
                
                try await Task.sleep(nanoseconds: 1_000_000_000)
                
                await MainActor.run {
                    self.isLoadingNextPage = false
                    self.userModels.append(contentsOf: newUserModels)
                    self.currentPage += Constants.pageStep
                }
            } catchInMain: { error in
                self.isLoadingNextPage = false
                self.errorText = error.localizedDescription
            }
        }

        // MARK: - Tap Actions
    }
}

// MARK: - ModuleInput
extension ViewModel: Module.ModuleInput {
    func configure(_ data: UsersModule.ConfigData) { }
}

// MARK: - Private Methods
private extension ViewModel {
    func fetchInitData() {
        guard self.networkMonitor.isConnected else { return }

        Task {
            let response = try await self.fetchHistory()
            self.isLoadingNextPage = false
            await MainActor.run {
                // self.saveHistoryToDisk(models: response)
                let userModels = response.map { UserModel(from: $0) }
                self.userModels = userModels
                self.currentPage += Constants.pageStep
                self.uiState = .withData
            }
        } catchInMain: { error in
            self.isLoadingNextPage = false
            self.errorText = error.localizedDescription
        }
    }

    func fetchHistory() async throws -> [ResponseModels.UserModel.User] {
        guard !isLoadingNextPage else {
            AppLog.debug("Already loaded next page")
            return []
        }
        self.isLoadingNextPage = true

        let request: RequestModels.Users = .init(
            page: currentPage,
            count: Constants.count
        )
        let response = try await self.usersService.getUsers(request)

        return response
    }
}
