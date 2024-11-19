//
//  CancelBag.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 16.08.2024.
//

import Combine

final class CancelBag {
    fileprivate(set) var subscriptions = Set<AnyCancellable>() // swiftlint:disable:this strict_fileprivate

    func cancel() {
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}

