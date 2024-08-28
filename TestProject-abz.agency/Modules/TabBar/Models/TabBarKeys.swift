//
//  TabBarKeys.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 24.08.2024.
//

import UIKit

private typealias Localization = AppLocale.TabBar.Tabs
private typealias Module = TabBarModule

extension Module {
    struct TabKeys: Identifiable, Hashable {
        static let users: Self = .init(
            title: Localization.users,
            image: UIImage(systemName: "person.3.sequence.fill") ?? .init())
        static let signUp: Self = .init(
            title: Localization.signUp,
            image: UIImage(systemName: "person.crop.circle.fill.badge.plus") ?? .init())
        
        var id: Self { self }
        var title: String
        var image: UIImage
        var secondImage: UIImage?
        var action: (() -> Void)?

        // MARK: - Public Properties
        func withAction(_ action: @escaping () -> Void) -> Self {
            var copy = self
            copy.action = action
            return copy
        }

        func withSecondImage(_ image: UIImage) -> Self {
            var copy = self
            copy.secondImage = image
            return copy
        }

        // MARK: - Equatable
        static func == (lhs: Self, rhs: Self) -> Bool {
            lhs.title == rhs.title &&
            lhs.image == rhs.image
        }

        // MARK: - Hashable
        func hash(into hasher: inout Hasher) {
            hasher.combine(title)
            hasher.combine(image)
        }
    }
}

