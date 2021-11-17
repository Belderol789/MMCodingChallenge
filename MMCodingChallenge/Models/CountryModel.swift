//
//  CountryModel.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/16/21.
//

import Foundation


struct CountryModel: Decodable {
    let name: CountryName
    var nativeName: NativeName?
    var independent: Bool?
    let status: String
    let unMember: Bool
    let region: String
    var subregion: String?
    let population: Double
    var maps: Maps?
    var tld: [String]?
    var capital: [String]?
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

struct Languages: Decodable {
    let languages: [String: String]
    private enum CodingKeys: String, CodingKey {
        case languages = "languages"
    }
}

struct Maps: Decodable {
    let googleMaps: String
}
