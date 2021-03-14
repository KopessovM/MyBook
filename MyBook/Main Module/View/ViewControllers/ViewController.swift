//
//  ViewController.swift
//  MyBook
//
//  Created by Madi Kupesov on 2/26/21.
//

import UIKit
import Moya
import Griffon_ios_spm

class ViewController: UIViewController {
    
    var booksRecommendation = Recommendation()
    private let viewModel = BooksViewModel()
    var books = [Books]()
    var indicator = UIActivityIndicatorView(style: .medium)
    
    lazy var myTableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .gray
        tableView.register(BooksTableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Books"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 24)!]
        makeRequest()
        setUpViews()
    }

}

//MARK: - Request

extension ViewController {
    func makeRequest() {
        indicator.startAnimating()
        getAllBooks()
    }
    
    func getAllBooks() {
        viewModel.getAllBooks { data in
            self.books = data
            DispatchQueue.main.async {
                self.myTableView.reloadData()
                self.stopLoading()
            }
        }
    }
    /*
    func getBookByID() {
        viewModel.getBookByID(bookID: (books)!) { data in
            self.books = data
            DispatchQueue.main.async {
                self.myTableView.reloadData()
                self.stopLoading()
            }
        }
    }
    */
}

//MARK: - Methods

extension ViewController {
    func stopLoading() {
        self.indicator.stopAnimating()
        self.booksRecommendation.isHidden = false
    }
}

//MARK: - UITableView

extension ViewController: UITableViewDataSource, UITableViewDelegate {
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
        /*
        detailVC.rentClick = { [weak self] in
            guard let self = self else { return }
            self.books[indexPath.row].enabled = true
        }
        */
        detailVC.favoriteBook = books[indexPath.row]
        
        detailVC.authorOfBook.text = books[indexPath.row].author
        detailVC.titleOfBook.text = books[indexPath.row].title
        viewModel.setBookImage(imagePath: books[indexPath.row].image ?? "nil", imageView: detailVC.bookImageView)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
}

//MARK: - SetupViews

extension ViewController {
    private func setUpViews() {
        self.view.backgroundColor = .white
        self.title = "Books"
        
        [myTableView, booksRecommendation].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        view.addSubview(indicator)
        indicator.center = self.view.center
        
        booksRecommendation.isHidden = true
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
