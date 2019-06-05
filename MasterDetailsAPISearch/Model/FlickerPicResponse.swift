//
//  FlickerPicResponse.swift
//  MasterDetailsAPISearch
//
//  Created by ToqaMohsen on 6/5/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import Foundation

struct FlickerPicResponse : Codable
{
    let photoId: String
    let farm: Int
    let secret: String
    let server: String
    let title: String
    
    var photoUrl: NSURL {
        return NSURL(string: "https://farm\(farm).staticflickr.com/\(server)/\(photoId)_\(secret)_m.jpg")!
    }
    
}
