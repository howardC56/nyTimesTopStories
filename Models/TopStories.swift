//
//  TopStories.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation

enum ImageFormat: String {
    case superJumbo = "superJumbo"
    case thumbLarge = "thumbLarge"
    case standard = "standard"
    case normal = "normal"
}

struct TopStories: Codable {
     let section: String
     let lastUpdated: String
     let results: [Article]
     private enum CodingKeys: String, CodingKey {
       case section
       case lastUpdated = "last_updated"
       case results
     }
   }
   
   struct Article: Codable {
     let section: String
     let title: String
     let abstract: String
     let publishedDate: String
     let multimedia: [Multimedia]
     private enum CodingKeys: String, CodingKey {
       case section
       case title
       case abstract
       case publishedDate = "published_date"
       case multimedia
     }
   }
   
   struct Multimedia: Codable {
     let url: String
     let format: String
     let height: Double
     let width: Double
     let caption: String
   }

extension Article {
    func getArticleImageUrl(_ imageFormat: ImageFormat) -> String {
        let results = multimedia.filter { $0.format == imageFormat.rawValue }
        guard let format = results.first else  { return "normal" }
        return format.url
    }
    
}
