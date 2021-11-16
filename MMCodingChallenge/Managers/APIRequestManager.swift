//
//  APIRequestManager.swift
//  KMCodingChallenge
//
//  Created by Kem Bel on 11/14/21.
//

import Alamofire
import Foundation


class APIRequestManager: NSObject {
    /// Responsible for all HTTP calls: GET, POST, PUT, & DELETE
    let session: Session
    
    init(session: Session? = nil) {
        self.session = session ?? APIManager.shared.session
        // If a custom session is needed, override else use default shared session from APIManager
    }
    
    func get<T>(url: URLConvertible, responseType: T.Type, parameters: Parameters? = nil, completionHandler: @escaping (APIResponseResult<T>) -> ()) where T: Decodable {
        session.request(url,
                        method: .get,
                        parameters: parameters,
                        encoding: JSONEncoding.default,
                        headers: nil,
                        interceptor: nil,
                        requestModifier: nil).responseJSON { responseType in
            print("ResponseType \(responseType)")
        }
    }
}
// MARK: - APIResponse
protocol APIResponseDecodable: Decodable {
    associatedtype DecodableType
    var data: DecodableType? { get set }
    var error: APIResponseError? { get set }
}

struct APIResponse<T: Decodable>: APIResponseDecodable {
    typealias DecodableType = T
    var data: DecodableType?
    var error: APIResponseError?
}
