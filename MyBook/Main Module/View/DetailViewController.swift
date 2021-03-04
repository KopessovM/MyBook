//
//  DetailViewController.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/4/21.
//

import UIKit

class DetailViewController: UIViewController {

    weak var mainVC = ViewController()
    
    lazy var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 7
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Gatsby")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var titleOfBook: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var authorOfBook: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    lazy var rent: UIButton = {
        let button = UIButton()
        button.setTitle("Rent", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(rentBook), for: .touchUpInside)
        return button
    }()
    
    @objc func rentBook() {
        print(mainVC?.books ?? "none")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUpViews()
    }
    
    private func setUpViews() {
        [bookImageView, titleOfBook, authorOfBook, rent].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        bookImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        bookImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bookImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        bookImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        titleOfBook.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 20).isActive = true
        titleOfBook.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleOfBook.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        authorOfBook.topAnchor.constraint(equalTo: titleOfBook.bottomAnchor, constant: 20).isActive = true
        authorOfBook.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        authorOfBook.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        rent.topAnchor.constraint(equalTo: authorOfBook.bottomAnchor, constant: 20).isActive = true
        rent.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        rent.widthAnchor.constraint(equalToConstant: 150).isActive = true
        rent.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

   
}
