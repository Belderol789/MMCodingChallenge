//
//  APIResponseResult.swift
//  KMCodingChallenge
//
//  Created by Kem Bel on 11/14/21.
//

import Alamofire

enum APIResponseResult<T: Decodable> {
    case success(_ response: T)
    case error(_ error: APIResponseError)
}

extension APIResponseResult {
    init(data: T) {
        self = .success(data)
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
