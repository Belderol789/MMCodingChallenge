//
//  CountryListViewModel.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/17/21.
//

import Foundation

struct CountryListViewModel {
    
    var countryList: [CountryModel] = [] {
        didSet {
            filteredCountryList = countryList
        }
    }
    var filteredCountryList: [CountryModel] = []
    
    var countryCount: Int {
        return filteredCountryList.count
    }
    
    func returnCountryOf(index: IndexPath) -> CountryModel? {
        guard index.row < countryCount else { return nil }
        return filteredCountryList[index.row]
    }
    
    mutating func addToList(country: CountryModel) {
        if !countryList.map({$0.name.official}).contains(country.name.official) {
            countryList.append(country)
        }
    }
    
    mutating func filterCountries(text: String?)  {
        if let text = text {
            filteredCountryList = countryList.filter({$0.name.official.contains(text)})
        } else {
            filteredCountryList = countryList
        }
    }
}
