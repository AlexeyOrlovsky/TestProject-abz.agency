//
//  Log.swift
//  TestProject-abz.agency
//
//  Created by Алексей Орловский on 30.08.2024.
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
    private enum LogType {
        case debug
        case error
    }

    fileprivate static let `default`: Log = .init( // swiftlint:disable:this strict_fileprivate
        subsystem: "morrterry2021-gmail.com.TestProject-abz-agency", // com.lottov.ANYApp
        category: "default"
    )

    // MARK: - Private Properties
    private let logger: Logger
    private let dateFormatter: DateFormatter = build {
        $0.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }

    // MARK: - Init
    public init(
        subsystem: String,
        category: String
    ) {
        self.logger = Logger(subsystem: subsystem, category: category)
    }

    // MARK: - LoggerProtocol
    public func debug(
        file: String = #file,
        function: String = #function,
        line: Int = #line,
        _ separator: String = "🔵",
        _ message: String = ""
    ) {
        log(file: file, function: function, line: line, separator, message, logType: .debug)
    }

    public func error(
        file: String = #file,
        function: String = #function,
        line: Int = #line,
        _ separator: String = "❌",
        _ message: String = ""
    ) {
        log(file: file, function: function, line: line, separator, message, logType: .error)
    }

    private func log(
        file: String = #file,
        function: String = #function,
        line: Int = #line,
        _ separator: String,
        _ message: String,
        logType: LogType
    ) {
        let fileComponents = file.components(separatedBy: ["/"])
        let shotFileName = fileComponents.last ?? file
        let date: Date = .now
        let stringDate = dateFormatter.string(from: date)

        switch logType {
            case .debug:
                logger.debug("\(stringDate) \(shotFileName).\(function):\(line) \(separator) \(message)")
            case .error:
                logger.error("\(stringDate) \(shotFileName).\(function):\(line) \(separator) \(message)")
        }
    }
}

