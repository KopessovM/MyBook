//
//  BooksService.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/3/21.
//

import Foundation
import Moya

enum BookService {
    case allBooks
    
    case getBookByID(rentID: Int)
}

extension BookService: TargetType {
    var baseURL: URL {
        return URL(string: "https://dar-library.dar-dev.zone/api")!
    }
    
    var path: String {
        switch self {
        case .allBooks:
            return "/books"
        case .getBookByID(let rentID):
            return "/rent/\(rentID)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .allBooks, .getBookByID:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .allBooks, .getBookByID:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .allBooks, .getBookByID:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
    
    
}
