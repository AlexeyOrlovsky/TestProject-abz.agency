![Logo-2](https://github.com/user-attachments/assets/8cfe5306-4fbb-4823-856a-865163ccc2f9)

Test task for the company ABZ.agency. The project also serves as an example of my code.

## Make sure to read the documentation and follow all recommendations

![Swift](https://img.shields.io/badge/Swift-5-orange)
![Platforms](https://img.shields.io/badge/Platforms-iOS-yellowgreen)
![Dependencies](https://img.shields.io/badge/Dependencies-Alamofire%2C%20Factory%2C%20FlowStacks%2C%20JWTDecode%2C%20KeychainAccess-blue)

## 🚀 Getting started
- Open `TestProject-abz.agency.xcodeproj.`
- Select a development team in the project settings.
- At the moment there are no scripts in the project that need to be run after installing the project. But! Make sure the following is installed on your Mac!
   - Make sure you have it installed [SwiftGen](https://github.com/SwiftGen/SwiftGen) - is a tool to automatically generate Swift code for resources. If not installed, follow the [Instruction](https://formulae.brew.sh/formula/swiftgen)
 - Also after installing swiftGen, make sure that all Packages are loaded!

## 📦 Dependencies
- [Alamofire](https://github.com/Alamofire/Alamofire) - For making HTTP requests and handling network responses.
- [Factory](https://github.com/hmlongco/Factory) - For creating and managing dependencies using Dependency Injection (DI).
- [FlowStacks](https://github.com/johnpatrickmorgan/FlowStacks) - For managing navigation in SwiftUI with support for screen stacks and deep navigation.
- [JWTDecode](https://github.com/auth0/JWTDecode.swift) - For decoding JWT tokens without needing to send them to a server.
- [KeychainAccess](https://github.com/kishikawakatsumi/KeychainAccess) - For securely storing sensitive data like passwords and tokens in the iOS Keychain.

## 🧩 Project Details

 - This approach was chosen because the project uses `SwiftUI`, and MVVM is a great fit, allowing for a multi-modular application.
 - The architecture makes it easier to maintain and extend the product in the future. The `Coordinator` pattern, which involves using a separate module responsible for navigation, helps reduce coupling between modules and integrates well with MVVM.
   ### 📂📁 Project structure
 - `App` - Responsible for launching the application + Coordinator
 - `Dependency Injection` - fill out
 - `Common` - fill out
 - `Modules` - fill out
 - `Networking` - fill out
 - `Utils` - fill out
 - `Resources` - fill out















