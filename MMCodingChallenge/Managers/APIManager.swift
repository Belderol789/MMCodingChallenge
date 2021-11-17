//
//  APIManager.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/16/21.
//

import Alamofire

struct APIBase {
    typealias BaseURL = URL
    static let url: BaseURL = APIManager.shared.baseUrl! // can force unwrap because a nil baseURL should have killed the app on setup
}

// MARK: - APIManager
final class APIManager: NSObject {
    /// Responsble for initial setup of baseURL and starting alamofire session
    internal var baseUrl: URL?
    internal var session: Session
    private var activeRequest: DataRequest?
    
    static var shared: APIManager {
        if let initializedShared = _shared {
            return initializedShared
        }
        fatalError("Singleton not yet initialized. Run setupURL(baseUrlString) first")
    }
    private static var _shared: APIManager?

    class func setupURL(baseUrlString: String) {
        _shared = APIManager(urlString: baseUrlString) // setup singleton on app launch so entire app can have access to the base url
    }
    
    private init(urlString: String) {
        let config = Session.default.session.configuration
        config.timeoutIntervalForRequest = 60
        self.session = Session(configuration: config)
        if let url = urlString.asURL() {
            self.baseUrl = url
        } else {
            fatalError("base url isn't responding")
        }
    }
}
