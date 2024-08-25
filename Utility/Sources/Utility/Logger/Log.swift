//
//  Log.swift
//
//
//  Created by Vyacheslav Razumeenko on 18.07.2024.
//

import Foundation
import OSLog

// MARK: - Log
public var AppLog: Log { Log.default } // swiftlint:disable:this identifier_name

// MARK: - Middleware
public protocol LoggerProtocol {
    func debug(
        file: String,
        function: String,
        line: Int,
        _ separator: String,
        _ message: String
    )
}

// MARK: - LoggerWrapper
public struct Log: LoggerProtocol {
    fileprivate static let `default`: Log = .init(category: "default") // swiftlint:disable:this strict_fileprivate

    // MARK: - Private Properties
    private let logger: Logger
    private let dateFormatter: DateFormatter = build {
        $0.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }

    // MARK: - Init
    public init(
        subsystem: String = Bundle.main.bundleIdentifier ?? "",
        category: String
    ) {
        self.logger = Logger(subsystem: subsystem, category: category)
    }

    // MARK: - LoggerProtocol
    public func debug(
        file: String = #file,
        function: String = #function,
        line: Int = #line,
        _ message: String = "",
        _ separator: String = "🔵"
    ) {
        let fileComponents = file.components(separatedBy: ["/"])
        let shotFileName = fileComponents.last ?? file
        let date: Date = .now
        let stringDate = dateFormatter.string(from: date)

        logger.debug("\(stringDate) \(shotFileName).\(function):\(line) \(separator) \(message)")
    }
}
