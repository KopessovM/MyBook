//
//  FavoritesViewController.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/12/21.
//

import UIKit

class FavoritesViewController: UIViewController {

    private let viewModel = BooksViewModel()
    
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
        setUpViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTable()
    }
    
    private func setUpViews() {
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func reloadTable() {
        self.myTableView.reloadData()
    }
}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavoritesViewModel.current.favoriteBooks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BooksTableViewCell
        viewModel.setBookImage(imagePath: FavoritesViewModel.current.favoriteBooks[indexPath.row].image ?? "none", imageView: cell!.coverOfBook)
        cell?.titleOfBook.text = FavoritesViewModel.current.favoriteBooks[indexPath.row].title
        cell?.authorOfBook.text = FavoritesViewModel.current.favoriteBooks[indexPath.row].author
        
        return cell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.favoriteBook = FavoritesViewModel.current.favoriteBooks[indexPath.row]
        detailVC.authorOfBook.text = FavoritesViewModel.current.favoriteBooks[indexPath.row].author
        detailVC.titleOfBook.text = FavoritesViewModel.current.favoriteBooks[indexPath.row].title
        viewModel.setBookImage(imagePath: FavoritesViewModel.current.favoriteBooks[indexPath.row].image ?? "nil", imageView: detailVC.bookImageView)
        detailVC.addToFavorite.setBackgroundImage(UIImage(named: "heart.filled"), for: .normal)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
