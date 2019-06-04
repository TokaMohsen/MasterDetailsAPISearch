//
//  MoviesService.swift
//  MasterDetailsAPISearch
//
//  Created by ToqaMohsen on 6/3/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import Foundation
import UIKit

class MoviesService {
    
    let moviesCache = NSCache<AnyObject, AnyObject>()
    
    private static var serviceSharedInstance: MoviesService = {
        let sharedService = MoviesService()
        
        return sharedService
    }()
    
    class func sharedInstance() -> MoviesService {
        return  serviceSharedInstance
    }
    
    func loadJson(filename fileName: String , completionBlock : @escaping (_ success: MoviesGetResponse?) -> Void)
    {
//        if let moviesFromCache = moviesCache.object(forKey: moviesJsonFileName as AnyObject) as? MoviesGetResponse {
//           // self.image = imageFromCache
//            completionBlock(moviesFromCache)
//
//        }
//        else
//        {
//
            if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    
                    let decoder = JSONDecoder()
                    let movies = try decoder.decode(MoviesGetResponse.self, from: data)
                    
                    moviesCache.setObject(movies as AnyObject, forKey: moviesJsonFileName as AnyObject)
                    completionBlock(movies)
                } catch {
                    print("error:\(error)")
                }
            }
        //}
        
    }
    
    
    func cacheMovies(completionBlock : @escaping (_ success: MoviesGetResponse?) -> Void) {
        if let moviesFromCache = moviesCache.object(forKey: moviesJsonFileName as AnyObject) as? MoviesGetResponse {
             completionBlock(moviesFromCache)
        }
    }
}
