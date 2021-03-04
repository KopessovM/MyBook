//
//  ViewController.swift
//  MyBook
//
//  Created by Madi Kupesov on 2/26/21.
//

import UIKit
import Moya
import Griffon_ios_spm

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var booksRecommendation = Recommendation()
    var books = [Books]()
    let provider = MoyaProvider<BookService>()
    
    
    lazy var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .gray
        tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BooksTableViewCell
        cell?.nameOfBook.text = books[indexPath.row].author
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        detailVC.authorOfBook.text = books[indexPath.row].author
        detailVC.titleOfBook.text = books[indexPath.row].title
        
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Books"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 20)!]
        setUpViews()
        
        provider.request(.allBooks) { (result) in
            switch result {
            case .success(let response):
                let booksData = try! JSONDecoder().decode([Books].self, from: response.data)
                self.books = booksData
                self.myTableView.reloadData()
                //let newBooks: Void = UserDefaults.standard.setValue(self.books, forKey: "book")
                //print(newBooks)
            case .failure( _):
                print("Error")
            }
        }
    }

    private func setUpViews() {
        [myTableView, booksRecommendation].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        booksRecommendation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        booksRecommendation.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        booksRecommendation.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        booksRecommendation.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        myTableView.topAnchor.constraint(equalTo: booksRecommendation.bottomAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //myTableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        //myTableView.widthAnchor.constraint(equalToConstant: view.bounds.width).isActive = true
        
    }

}

