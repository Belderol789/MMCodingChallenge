//
//  CountryModel.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/16/21.
//

import Foundation

struct CountryModel: Decodable {
    let name: CountryName
    let nativeName: NativeName
    let tld: [String]
    let cca2: String
    let ccn3: String
    let cca3: String
    let cioc: String
    let independent: Bool
    let status: String
    let unMember: Bool
    let currencies: Currencies
    let capital: [String]
    let region: String
    let subregion: String
    let languages: Languages
    let population: Double
}

struct CountryName: Decodable {
    let common: String
    let official: String
}

struct NativeName: Decodable {
    let nativeNames: [String: CountryName]
    private enum CodingKeys: String, CodingKey {
        case nativeNames = "nativeNames"
    }
}

struct Currencies: Decodable {
    struct Currency: Decodable {
        let name: String
        let symbol: String
    }
    
    let currencies: [String: Currency]
    
    private enum CodingKeys: String, CodingKey {
        case currencies = "currencies"
    }
}

struct Languages: Decodable {
    let languages: [String: String]
    private enum CodingKeys: String, CodingKey {
        case languages = "languages"
    }
}

struct Maps: Decodable {
    let googleMaps: [String: URL]
}
