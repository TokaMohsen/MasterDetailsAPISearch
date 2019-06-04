//
//  MasterPresenter.swift
//  MasterDetailsAPISearch
//
//  Created by ToqaMohsen on 6/4/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import Foundation

class MasterPresenter
{
    static  func search(objectResponse : [movies] , title : String) -> [movies]? {
        
        var filteredResults : [movies]?
        let sortListObj = SortList()
        var sorted = [movies]()
        filteredResults = objectResponse.filter({ $0.title.localizedCaseInsensitiveContains(title)})
        if filteredResults?.count != 0{
            sorted = sortListObj.mergeSort(filteredResults!)
            // category with year
            //return dictionary of key (year) and value (array of movies sorted by rate)
        }
        return sorted
        
    }
}
