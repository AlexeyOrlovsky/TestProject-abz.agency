// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation
import SwiftUI

// swiftlint:disable all
// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum AppLocale {
    // MARK: - Constants

    public enum Constants {
        public static let defaultTable: String = "Localizable"
    }

    private static var currentLocalize: LocalizeKeys = .english

    public static var currentLanguageCode: String { currentLocalize.code }


  public enum General {
      /// Test Task
      public static var appName: String { AppLocale.tr("Localize", "general.appName") }
  }

  public enum NoConnection {
      /// Try again
      public static var buttonText: String { AppLocale.tr("Localize", "noConnection.buttonText") }
      /// There is no internet connection
      public static var noConnection: String { AppLocale.tr("Localize", "noConnection.noConnection") }
  }

  public enum SignUpFailed {
      /// Try again
      public static var buttonText: String { AppLocale.tr("Localize", "signUpFailed.buttonText") }
      /// That email is already registered
      public static var emailAlready: String { AppLocale.tr("Localize", "signUpFailed.emailAlready") }
  }

  public enum SignUpSuccess {
      /// Got it
      public static var buttonText: String { AppLocale.tr("Localize", "signUpSuccess.buttonText") }
      /// User successfully registered
      public static var successfully: String { AppLocale.tr("Localize", "signUpSuccess.successfully") }
  }

  public enum TabBar {
    public enum Tabs {
        /// Sign up
        public static var signUp: String { AppLocale.tr("Localize", "tabBar.tabs.signUp") }
        /// Users
        public static var users: String { AppLocale.tr("Localize", "tabBar.tabs.users") }
    }
  }

  public enum Users {
      /// There are no users yet
      public static var notYet: String { AppLocale.tr("Localize", "users.notYet") }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

public extension AppLocale {
    static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
        // swiftlint:disable:next nslocalizedstring_key
        let path = Bundle(for: BundleToken.self).path(forResource: AppLocale.currentLanguageCode, ofType: "lproj")
        let bundle = Bundle(path: path!) ?? Bundle(for: BundleToken.self)
        let format = NSLocalizedString(key, tableName: table, bundle: bundle, comment: "")
        return String(format: format, locale: Locale.current, arguments: args)
    }
    static func tr(_ key: String) -> String {
        tr(Constants.defaultTable, key)
    }
}

private final class BundleToken {}
// swiftlint:enable all