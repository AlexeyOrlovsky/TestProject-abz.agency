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
        @Published private(set) var positionModels: [PositionModel] = []
        @Published private(set) var errorText: String = ""

        // MARK: - Private Properties

        // MARK: - Services
        private var signUpService: SignUpService
        private var tokenService: TokenService

        // MARK: - Managers

        // MARK: - Helpers
        private var cancellable: CancelBag = .init()

        // MARK: - Init
        init(
            signUpService: SignUpService,
            tokenService: TokenService
        ) {
            self.signUpService = signUpService
            self.tokenService = tokenService
        }

        // MARK: - Lifecycle
        func onAppear() {
            cancellable.cancel()
            
            fetchInitToken()
            fetchInitPositions()
        }
        
        // MARK: - Public Methods
        func isValidEmail(_ email: String) -> Bool {
            let emailRegEx = "(?:[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
            
            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailPred.evaluate(with: email)
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
    func fetchInitPositions() {
        Task {
            let fetchedPositions = try await self.fetchPositions()
            self.positionModels = fetchedPositions.map { PositionModel(from: $0) }
        } catchInMain: { error in
            self.errorText = error.localizedDescription
        }
    }
    
    func fetchPositions() async throws -> [ResponseModels.PositionModel.Position] {
        let request: RequestModels.Positions = .init()
        let response = try await self.signUpService.getPositions(request)
        
        debugPrint(response)
        
        return response
    }
    
    func fetchInitToken() {
        Task {
            try await self.fetchToken()
        } catchInMain: { error in
            self.errorText = error.localizedDescription
        }
    }
    
    func fetchToken() async throws {
        let token = try await tokenService.fetchToken()
        globalAuthToken = token
    }
}
