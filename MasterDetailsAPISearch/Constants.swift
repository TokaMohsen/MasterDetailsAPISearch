//
//  Constants.swift
//  SearchAPIBased
//
//  Created by ToqaMohsen on 6/3/19
//  Copyright © 2019 MeinVodafone. All rights reserved.
//

import Foundation

let serviceFailureMsg = "service failed"
let filterFailureMsg = "Keyword doesn't match any movie"
let moviesJsonFileName = "movies"

struct FlickrURLParams {
    static let APIScheme = "https"
    static let APIHost = "api.flickr.com"
    static let APIPath = "/services/rest"
}
