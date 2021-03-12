//
//  FavoritesViewController.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/12/21.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    
    var favoriteBooks = [Books]()
    
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
        let vc = ViewController()
        vc.transferToFavorites = { [weak self] in
            guard let self = self else { return }
        }
        
    }

    private func setUpViews() {
        view.addSubview(myTableView)
        myTableView.translatesAutoresizingMaskIntoConstraints = false
        
        myTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        myTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        myTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        myTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    
}
