//
//  SignUpViewModel.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 19.08.2024.
//

import Foundation

private typealias Module = SignUpModule
private typealias ViewModel = Module.ViewModel

// MARK: - ViewModel
extension Module {
    final class ViewModel: ViewModelProtocol {
        // MARK: - Public Properties
        @Published private(set) var errorText: String = ""

        // MARK: - Private Properties

        // MARK: - Services
        private var signUpService: SignUpService

        // MARK: - Managers

        // MARK: - Helpers
        private var cancellable: CancelBag = .init()

        // MARK: - Init
        init(
            signUpService: SignUpService
        ) {
            self.signUpService = signUpService
        }

        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
        }

        // MARK: - Tap Actions
        func didTapRegister(name: String, email: String, phone: String, positionId: Int, photo: String) async throws {
            let requestModel: RequestModels.SignUpModel = .init(
                name: name,
                email: email,
                phone: phone,
                positionId: positionId,
                photo: photo
            )
            do {
                let resultModel = try await self.signUpService.signUp(requestModel)
                // self.saveUser(model: resultModel)
            } catch let error {
                await MainActor.run {
                    self.errorText = error.localizedDescription
                }
                throw error
            }
        }
    }
}

// MARK: - Private Methods
private extension ViewModel {
}
