//
//  results.swift
//  SearchAPIBased
//
//  Created by ToqaMohsen on 6/3/19


import Foundation

struct movies: Codable  {
    var title : String!
    var year : Int?
    var cast : [String]?
    var genres : [String]?
    var rating : Int?

}

