//
//  CancelBag.swift
//
//
//  Created by Vyacheslav Razumeenko on 18.07.2024.
//

import Combine

public final class CancelBag {
    fileprivate(set) var subscriptions = Set<AnyCancellable>() // swiftlint:disable:this strict_fileprivate

    public init(subscriptions: Set<AnyCancellable> = Set<AnyCancellable>()) {
        self.subscriptions = subscriptions
    }

    public func store(_ cancellable: AnyCancellable) {
        self.subscriptions.insert(cancellable)
    }

    public func cancel() {
        subscriptions.removeAll()
    }
}

public extension AnyCancellable {
    func store(in cancelBag: CancelBag) {
        cancelBag.store(self)
    }
}
