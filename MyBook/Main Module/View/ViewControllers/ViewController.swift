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
    private let viewModel = BooksViewModel()
    var books = [Books]()
    var transferToFavorites: (() -> ())?
    
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
        viewModel.setBookImage(imagePath: books[indexPath.row].image ?? "nil", imageView: cell!.coverOfBook)
        cell?.titleOfBook.text = books[indexPath.row].title
        cell?.authorOfBook.text = books[indexPath.row].author

        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        
        detailVC.rentClick = { [weak self] in
            guard let self = self else { return }
            self.books[indexPath.row].enabled = true
        }
        detailVC.clickToFavorites = { 
            if let transferToFavorites = self.transferToFavorites {
                transferToFavorites()
            }
        }
        
        detailVC.authorOfBook.text = books[indexPath.row].author
        detailVC.titleOfBook.text = books[indexPath.row].title
        viewModel.setBookImage(imagePath: books[indexPath.row].image ?? "nil", imageView: detailVC.bookImageView)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.title = "Books"
        
        viewModel.getAllBooks { data in
            self.books = data
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
        
        //self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 24)!]
        setUpViews()
      
    }

    private func setUpViews() {
        [myTableView, booksRecommendation].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        booksRecommendation.backgroundColor = UIColor(red: 192, green: 191, blue: 221)
        booksRecommendation.layer.cornerRadius = 15
        
        booksRecommendation.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        booksRecommendation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        booksRecommendation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        booksRecommendation.bottomAnchor.constraint(equalTo: myTableView.topAnchor, constant: -20).isActive = true
        booksRecommendation.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        myTableView.topAnchor.constraint(equalTo: booksRecommendation.bottomAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
    }

}

