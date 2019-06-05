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
        
        filteredResults = objectResponse.filter({ $0.title.localizedCaseInsensitiveContains(title)})
        if filteredResults?.count != 0{
//            let slicedList: Arra
//               slicedList = filteredResults?[0..<5]
            
                //filteredResults?.prefix(5)
            
            sorted = sortListObj.mergeSort(filteredResults!)
             var slicedList: Slice<[movies]>
            if (sorted.count >= 4)
            {
               slicedList = (sorted[0..<5])
            }
            else
            {
                slicedList = (sorted[0..<sorted.count])
            }
            
            var slicedArrayArray: [movies] = Array(slicedList)
            sortedGroups = Dictionary(grouping: slicedArrayArray, by: { $0.year! })
          
            // category with year
            //return dictionary of key (year) and value (array of movies sorted by rate)
        }
        
        return sortedGroups
        
    }
}
