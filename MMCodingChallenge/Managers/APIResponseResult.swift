//
//  APIResponseResult.swift
//  KMCodingChallenge
//
//  Created by Kem Bel on 11/14/21.
//

import Alamofire

enum APIResponseResult<T: Decodable> {
    case success(_ response: T, count: Int?)
    case error(_ error: APIResponseError)
}

extension APIResponseResult {
    init(data: T, count: Int? = 0) {
        self = .success(data, count: count)
    }
    
    init(error: Error) {
        self = .error(APIResponseError(title: "Ooops", message: error.localizedDescription))
    }
}

struct APIResponseError: Decodable {
    var title: String?
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case message
    }
}
