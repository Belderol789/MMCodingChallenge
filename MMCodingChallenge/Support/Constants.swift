//
//  Constants.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/17/21.
//

import Foundation

class Constants: NSObject {
    static let shared = Constants()
    
    var baseUrlString: String {
        return "https://restcountries.com/v3.1"
    }
    
}
