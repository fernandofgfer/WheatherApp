//
//  WheatherViewModel.swift
//  WheatherApp
//
//  Created by Fernando García Fernández on 27/3/17.
//  Copyright © 2017 Fernando García Fernández. All rights reserved.
//

import Foundation

class WheatherViewModel: NSObject{
    
    var data: [String]!
    var dataFiltered: [String]!
    
    override init() {
        data = ["San Francisco","New York","San Jose","Chicago","Los Angeles","Austin","Seattle"]
        dataFiltered = data
    }
    
    func getDataCount() -> Int{
        return dataFiltered.count
    }
    
    func getCityByIndex(index: Int) -> String{
        return dataFiltered[index]
    }
    
    func filterCities(searchText: String){
        dataFiltered = data.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        
        if searchText.isEmpty && dataFiltered.count == 0{
            dataFiltered = data
        }
    }
    
}
