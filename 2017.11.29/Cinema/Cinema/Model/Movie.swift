//
//  Movie.swift
//  Cinema
//
//  Created by Benny Davidovitz on 29/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit

class Movie: NSObject {
    let id : Int
    let title : String?
    let vote : Double?
    let thumbnailPosterUrl : URL?
    let posterUrl : URL?
    let originalTitle : String?
    let overview : String?
    let releaseDate : String?
    
    init?(_ dict : [String:Any]){
        guard let id = dict["id"] as? Int else{
            return nil
        }
        
        self.id = id
        self.title = dict["title"] as? String
        self.vote = dict["vote_average"] as? Double //?? 0
        
        if let posterPath = dict["poster_path"] as? String{
            let baseUrl = "https://image.tmdb.org/t/p/"
            self.thumbnailPosterUrl = URL(string: baseUrl + "w185" + posterPath)
            self.posterUrl = URL(string: baseUrl + "w780" + posterPath)
        } else {
            self.thumbnailPosterUrl = nil
            self.posterUrl = nil
        }
        
        self.originalTitle = dict["original_title"] as? String
        self.overview = dict["overview"] as? String
        self.releaseDate = dict["release_date"] as? String
        
        
    }
}















