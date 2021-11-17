//
//  APIPaths.swift
//  KMCodingChallenge
//
//  Created by Kem Bel on 11/14/21.
//

import Alamofire

enum APIPaths: URLConvertible {
    case all
    case name(name: String)
    case code(code: String)
    case capital(capital: String)
    case region(region: String)
    
    private var path: String {
        switch self {
        case .all:
            return ("/all")
        case .name(let name):
            return ("/name/" + name.lowercased())
        case .code(let code):
            return ("/alpha/" + code.lowercased())
        case .capital(let capital):
            return ("/capital/" + capital)
        case .region(let region):
            return ("/region/" + region)
        }
    }
    
    func asURL() throws -> URL {
        let url = APIManager.shared.baseUrl
        let path = path
        let urlWithPath = url.flatMap { URL(string: $0.absoluteString + path) }
        return urlWithPath ?? URL(string: "url to error page")!
    }
}
