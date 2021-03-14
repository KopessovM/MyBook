//
//  BooksViewModel.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/4/21.
//

import Foundation
import Moya
import UIKit

class BooksViewModel {

    let provider = MoyaProvider<BookService>()
    
    public func getAllBooks(completion: @escaping ([Books]) -> ()) {
        provider.request(.allBooks) { (result) in
            switch result {
            case .success(let response):
                do {
                    let getBooks = try JSONDecoder().decode([Books].self, from: response.data)
                    completion(getBooks)
                }
                catch let error {
                    print(error.localizedDescription)
                }
            case .failure( _):
                print("Error")
            }
        }
    }

    func getBookByID(bookID: Int, comp: @escaping ([Books])->()){
        provider.request(.getBookByID(rentID: bookID)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let loadRent = try JSONDecoder().decode([Books].self, from: response.data)
                    print(loadRent)
                    comp(loadRent)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error)
            }
        }
    }


    let bookImageProvider = MoyaProvider<BooksImageService>()
        
    public func getImage(path: String, completion: @escaping (Data) -> ()){
        bookImageProvider.request(.getBookImage(path: (path))) { (result) in
            switch result{
            case .success(let response):
                completion(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    public func setBookImage(imagePath: String, imageView: UIImageView){
        getImage(path: imagePath) { [weak self] (imageData) in
            guard self != nil else { return }
            if let image = UIImage(data: imageData){
                imageView.image = image
            } else {
                imageView.image = UIImage(named: "No image")
            }
        }
    }
}

