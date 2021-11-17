//
//  CountryListViewModel.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/17/21.
//

import Foundation

struct CountryListViewModel {
    

    var countryList: [CountryModel] = []
    
    var countryCount: Int {
        return countryList.count
    }
    
    func returnCountryOf(index: IndexPath) -> CountryModel? {
        guard index.row < countryCount else { return nil }
        return countryList[index.row]
    }
    
    mutating func addToList(country: CountryModel) {
        if !countryList.map({$0.name.official}).contains(country.name.official) {
            countryList.append(country)
        }
    }
}
