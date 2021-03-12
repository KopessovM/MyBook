//
//  SearchingViewController.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/10/21.
//

import UIKit

class SearchingViewController: UIViewController {
    var books = [Books]()
    var filteredBooks = [Books]()
    private let viewModel = BooksViewModel()
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.autocapitalizationType = .none
        search.placeholder = " isbn | title | author "
        
        return search
    }()
    
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
        self.view.backgroundColor = .white
        searchBar.delegate = self
        setUpViews()
        viewModel.getAllBooks { data in
            self.books = data
            
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
            
        }
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        searchBar.resignFirstResponder() // dismiss keyboard
    }
    
    private func setUpViews() {
        [searchBar, myTableView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        myTableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    
}

extension SearchingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBooks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BooksTableViewCell
        viewModel.setBookImage(imagePath: filteredBooks[indexPath.row].image ?? "nil", imageView: cell!.coverOfBook)
        cell?.titleOfBook.text = filteredBooks[indexPath.row].title
        cell?.authorOfBook.text = filteredBooks[indexPath.row].author
        return cell!
    }
}


extension SearchingViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredBooks = []
        
        if searchText == "" {
            filteredBooks = books
        }
        else {
            var i = 0
            guard let titleOfBook = books[i].title else { return }
            for book in titleOfBook {
                if book.lowercased().contains(searchText.lowercased()) {
                    filteredBooks.append(books[i])
                    i += 1
                }
            }
        }
        self.myTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text != nil else { return }
        
        
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //tableView.reloadData()
    }
}




