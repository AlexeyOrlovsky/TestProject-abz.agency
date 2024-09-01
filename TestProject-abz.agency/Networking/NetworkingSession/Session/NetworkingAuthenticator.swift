//
//  NetworkingAuthenticator.swift
//
//  Created Алексей Орловский on 04.07.2023.
//

import Foundation
import Alamofire

public final class OAuthAuthenticator: Authenticator {
    public weak var delegate: OAuthAuthenticatorDelegate?

    public struct OAuthCredential: AuthenticationCredential {
        public let accessToken: String
        public let refreshToken: String
        public let expiration: Date

        public init(accessToken: String, refreshToken: String, expiration: Date) {
            self.accessToken = accessToken
            self.refreshToken = refreshToken
            self.expiration = expiration
        }

        // Require refresh if within 1 minute of expiration
//        public var requiresRefresh: Bool { Date(timeIntervalSinceNow: 60 * 1) > expiration }
        public var requiresRefresh: Bool { .now > expiration }
    }

    public func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
        delegate?.apply(credential, to: &urlRequest)
    }

    public func refresh(
        _ credential: OAuthCredential,
        for session: Session,
        completion: @escaping (Result<OAuthCredential, Error>) -> Void
    ) {
        // Refresh the credential using the refresh token...then call completion with the new credential.
        //
        // The new credential will automatically be stored within the `AuthenticationInterceptor`. Future requests will
        // be authenticated using the `apply(_:to:)` method using the new credential.
        debugPrint("🔄 Try to refresh token")
        delegate?.refresh(credential: credential, completion: completion)
    }

    public func didRequest(
        _ urlRequest: URLRequest,
        with response: HTTPURLResponse,
        failDueToAuthenticationError error: Error
    ) -> Bool {
        // If authentication server CANNOT invalidate credentials, return `false`

        // If authentication server CAN invalidate credentials, then inspect the response matching against what the
        // authentication server returns as an authentication failure. This is generally a 401 along with a custom
        // header value.
        guard let delegate = delegate else { return false }

        return delegate.didRequest(urlRequest, with: response, failDueToAuthenticationError: error)
    }

    public func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
        // If authentication server CANNOT invalidate credentials, return `true`
        guard let delegate = delegate else { return true }

        return delegate.isRequest(urlRequest, authenticatedWith: credential)

        // If authentication server CAN invalidate credentials, then compare the "Authorization" header value in the
        // `URLRequest` against the Bearer token generated with the access token of the `Credential`.
        // let bearerToken = HTTPHeader.authorization(bearerToken: credential.accessToken).value
        // return urlRequest.headers["Authorization"] == bearerToken
    }
}
