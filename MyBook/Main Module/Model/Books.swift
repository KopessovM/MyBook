//
//  Books.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/3/21.
//

import Foundation

struct Root: Codable {
    let books: [Books]
}

struct Books: Codable {
    
    var id: Int?
    var isbn, title, author: String?
    var enabled: Bool?
    let image: String?
    //let publishDate: String
    //let genreID: Int?
    //let createdAt, updatedAt: String
    
}
