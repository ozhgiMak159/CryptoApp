//
//  CoinDetailModel.swift
//  CryptoApp
//
//  Created by Maksim  on 29.08.2022.
//

import Foundation

struct CoinDetailModel: Decodable {
    let id, symbol, name: String?
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, description, links
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
    }
    
    var readableDescription: String? {
      return description?.en?.removingHTMLOccurrences
    }
    
}

struct Links: Decodable {
    let homepage: [String]?
    let subredditURL: String?
    
    enum CodingKeys: String, CodingKey {
        case homepage
        case subredditURL = "subreddit_url"
    }
}

struct Description: Decodable {
    let en: String?
}

