//
//  Data+Extension.swift
//
//  Created Алексей Орловский on 04.07.2023.
//

import Foundation

public extension Data {
    var toString: String {
        String(decoding: self, as: UTF8.self)
    }

    func convertToDictionary() -> [String: AnyObject]? {
        do {
            return try JSONSerialization.jsonObject(with: self, options: []) as? [String: AnyObject]
        } catch _ as NSError {
            return nil
        }
    }

    // NSString gives us a nice sanitized debugDescription
    var prettyPrintedJSONString: NSString? {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
        else { return nil }

        return prettyPrintedString
    }
}
