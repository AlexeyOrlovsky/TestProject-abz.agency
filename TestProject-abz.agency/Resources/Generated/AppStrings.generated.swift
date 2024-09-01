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

  public enum SignUp {
      /// Sign up
      public static var buttonText: String { AppLocale.tr("Localize", "signUp.buttonText") }
      /// Email
      public static var emailField: String { AppLocale.tr("Localize", "signUp.emailField") }
      /// Invalid email format
      public static var emailInvalid: String { AppLocale.tr("Localize", "signUp.emailInvalid") }
      /// Your name
      public static var nameField: String { AppLocale.tr("Localize", "signUp.nameField") }
      /// Phone
      public static var phoneField: String { AppLocale.tr("Localize", "signUp.phoneField") }
      /// +38 (XXX) XXX - XX - XX
      public static var phoneNumberExample: String { AppLocale.tr("Localize", "signUp.phoneNumberExample") }
      /// Photo is required
      public static var photoIsRequired: String { AppLocale.tr("Localize", "signUp.photoIsRequired") }
      /// Required field
      public static var requiredField: String { AppLocale.tr("Localize", "signUp.requiredField") }
      /// Select your position
      public static var selectPosition: String { AppLocale.tr("Localize", "signUp.selectPosition") }
      /// Upload
      public static var upload: String { AppLocale.tr("Localize", "signUp.upload") }
      /// Upload your photo
      public static var uploadPhoto: String { AppLocale.tr("Localize", "signUp.uploadPhoto") }
    public enum Position {
        /// Backend developer
        public static var backend: String { AppLocale.tr("Localize", "signUp.position.backend") }
        /// Designer
        public static var designer: String { AppLocale.tr("Localize", "signUp.position.designer") }
        /// Frontend developer
        public static var frontend: String { AppLocale.tr("Localize", "signUp.position.frontend") }
        /// QA
        public static var qa: String { AppLocale.tr("Localize", "signUp.position.qa") }
    }
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