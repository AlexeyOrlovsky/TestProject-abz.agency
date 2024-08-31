//
//  BuildBlocks.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 30.08.2024.
//

import UIKit

// MARK: - Build
public func build<T>(_ object: T, builder: (T) -> Void) -> T {
    builder(object)
    return object
}

public func build<T: UIView>(builder: (T) -> Void) -> T {
    build(T(), builder: builder)
}

public func build<T: NSObject>(builder: (T) -> Void) -> T {
    build(T(), builder: builder)
}

