//
//  DataRequest+Extension.swift
//
//  Created by Алексей Орловский on 04.07.2023.
//

import Foundation
import Alamofire

extension DataRequest {
    func asyncResponseData(
        queue: DispatchQueue = .main,
        dataPreprocessor: DataPreprocessor = DataResponseSerializer.defaultDataPreprocessor,
        emptyResponseCodes: Set<Int> = DataResponseSerializer.defaultEmptyResponseCodes,
        emptyRequestMethods: Set<HTTPMethod> = DataResponseSerializer.defaultEmptyRequestMethods
    ) async -> AFDataResponse<Data> {
        await withCheckedContinuation { continuation in
            self.responseData(
                queue: queue,
                dataPreprocessor: dataPreprocessor,
                emptyResponseCodes: emptyResponseCodes,
                emptyRequestMethods: emptyRequestMethods
            ) { response in
                continuation.resume(returning: response)
            }
        }
    }
}
