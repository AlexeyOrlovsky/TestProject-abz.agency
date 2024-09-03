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
            static let initialPage: Int = 2
            static let pageStep: Int = 1
            static let count: Int = 4
        }
        
        // MARK: - Public Properties
        private(set) var uiState: TabState = .withData
        private(set) var userModels: [UserModel] = []
        private(set) var errorText: String = ""
        // @Published private(set) var uiState: TabState = .withData
        // @Published private(set) var userModels: [UserModel] = []
        // @Published private(set) var errorText: String = ""
        
        // MARK: - Dependencies
        weak var moduleOutput: ModuleOutput?

        // MARK: - Private Properties
        private var currentPage = Constants.initialPage
        private var isLoadingNextPage = false
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
            
            fetchInitData()
        }
        
        // MARK: - ViewModelProtocol
        func fetchNextPage() {
            Task {
                do {
                    let usersResponse = try await self.fetchHistory()
                    let newUserModels = usersResponse.map { UserModel(from: $0) }
                    self.userModels.append(contentsOf: newUserModels)
                    self.isLoadingNextPage = false
                    await MainActor.run {
                        self.currentPage += Constants.pageStep
                    }
                } catch {
                    self.isLoadingNextPage = false
                    self.errorText = error.localizedDescription
                }
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
            do {
                let usersResponse = try await self.fetchHistory()
                let userModels = usersResponse.map { UserModel(from: $0) }
                self.userModels = userModels
                self.isLoadingNextPage = false
                await MainActor.run {
                    self.currentPage += Constants.pageStep
                }
            } catch {
                self.isLoadingNextPage = false
                self.errorText = error.localizedDescription
            }
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
