//
//  AddProductModel.swift
//  WiproPracticalTest
//
//  Created by Jitendra Patel on 16/10/23.
//

import Foundation

struct AddProductModel: Codable {
    
    var id: Int? = nil
    var title: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case title = "title"
    }
    
    init(id: Int? = nil, title: String) {
        
        self.id = id
        self.title = title
    }
    
    init(from decoder: Decoder) throws {
        
        let value = try decoder.container(keyedBy: CodingKeys.self)
        id = try? value.decodeIfPresent(Int.self, forKey: .id)
        title = try? value.decodeIfPresent(String.self, forKey: .title)
    }
    
    init(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
    }
}
