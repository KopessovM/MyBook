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
}

extension BookService: TargetType {
    var baseURL: URL {
        return URL(string: "https://dar-library.dar-dev.zone/api")!
    }
    
    var path: String {
        switch self {
        case .allBooks:
            return "/books"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .allBooks:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .allBooks:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type" : "application/json"]
    }
    
    
}



