//
//  Task+Extension.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 01.09.2024.
//

import Foundation

extension Task where Failure == Never, Success == Void {
    @discardableResult
    /// Usage example:
    /// ```
    /// Task {
    ///     let requestModel: RequestModels.SignUpModel = .init(userName: phoneNumber, password: password)
    ///     let resultModel = try await self.authService.signUp(requestModel)
    ///     self.saveUser(model: resultModel)
    /// } catch: { error in
    ///     AppLog.error(error.localizedDescription)
    /// }
    /// ```
    init(
        priority: TaskPriority? = nil,
        operation: @escaping () async throws -> Void,
        `catch`: @escaping (Error) -> Void
    ) {
        self.init(priority: priority) {
            do {
                _ = try await operation()
            } catch {
                `catch`(error)
            }
        }
    }

    @discardableResult
    init(
        priority: TaskPriority? = nil,
        operation: @escaping () async throws -> Void,
        `catchInMain`: @escaping (Error) -> Void
    ) {
        self.init(priority: priority) {
            do {
                _ = try await operation()
            } catch {
                await MainActor.run {
                    `catchInMain`(error)
                }
            }
        }
    }
}
