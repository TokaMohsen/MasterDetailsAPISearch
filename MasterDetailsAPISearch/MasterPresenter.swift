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
    static  func search(objectResponse : [movies] , title : String) -> Dictionary<Int,[movies]>? {
        
        var filteredResults : [movies]?
        let sortListObj = SortList()
        var sorted = [movies]()
        var sortedGroups = Dictionary<Int,[movies]>()
        
        // category with year
        //return dictionary of key (year) and value (array of movies sorted by rate)
        
        filteredResults = objectResponse.filter({ $0.title.localizedCaseInsensitiveContains(title)})
        if filteredResults?.count != 0{
            var slicedList: Slice<[movies]>
            
            let slicedArrayArray: [movies] = filteredResults!
            sortedGroups = Dictionary(grouping: slicedArrayArray, by: { $0.year! })
            for (key, _) in sortedGroups
            {
                if (sortedGroups[key]?.capacity)! > 1
                {
                    sorted = sortListObj.mergeSort( sortedGroups[key]!)
                    if (sorted.count > 4)
                    {
                        slicedList = (sorted[0..<5])
                    }
                    else
                    {
                        slicedList = (sorted[0..<sorted.count])
                        
                    }
                           sortedGroups[key] = Array(slicedList)
                }
                
                }
                
            
        }
        
        return sortedGroups
        
    }
}
