//
//  ProductModels.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import Foundation

struct Product: Codable {
    
    let id: String?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?
    let ratting: Rate?
    
    enum CodingKeys: String, CodingKey {
        case id = "ids"
        case title = "title"
        case price = "price"
        case description = "description"
        case category = "category"
        case image = "image"
        case ratting = "ratting"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try? values.decodeIfPresent(String.self, forKey: .title)
        price = try? values.decodeIfPresent(Double.self, forKey: .price)
        description = try? values.decodeIfPresent(String.self, forKey: .description)
        category = try? values.decodeIfPresent(String.self, forKey: .category)
        image = try? values.decodeIfPresent(String.self, forKey: .image)
        ratting = try? values.decodeIfPresent(Rate.self, forKey: .ratting)
    }
}

struct Rate: Codable {
    let rate: Float?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case rate = "rate"
        case count = "count"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rate = try? values.decodeIfPresent(Float.self, forKey: .rate)
        count = try? values.decode(Int.self, forKey: .count)
    }
}
