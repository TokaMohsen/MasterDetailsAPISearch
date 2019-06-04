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
    
    let moviesCache = NSCache<NSString, MoviesGetResponse>()
    
    private static var serviceSharedInstance: MoviesService = {
        let sharedService = MoviesService()
        
        return sharedService
    }()
    
    class func sharedInstance() -> MoviesService {
        return  serviceSharedInstance
    }
    
    func fetchJson(filename fileName: String , completionBlock : @escaping (_ success: MoviesGetResponse?) -> Void)
    {
                if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
                    do {
                        let data = try Data(contentsOf: url)
                        
                        let decoder = JSONDecoder()
                        let movies = try decoder.decode(MoviesGetResponse.self, from: data)
                        
                        self.moviesCache.setObject(movies , forKey: moviesJsonFileName as NSString )
                        completionBlock(movies)
                    } catch {
                        print("error:\(error)")
                    }
                }
    }
    
    
    func loadcachedMovies(completionBlock : @escaping (_ success: [movies]?) -> Void) {
        if let moviesFromCache = moviesCache.object(forKey: moviesJsonFileName as NSString) {
            completionBlock(moviesFromCache.movies)
        }
        else{
            fetchJson(filename: moviesJsonFileName) { (data) in
                if let downloadMoviesList = data?.movies
                {
                    completionBlock(downloadMoviesList)
                }
            }
        }
    }
    
    
}

