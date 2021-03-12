//
//  BooksTableViewCell.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/3/21.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    var rating = Rating()
    
    lazy var coverOfBook: UIImageView = {
        let cover = UIImageView()
        cover.layer.cornerRadius = 5
        cover.layer.masksToBounds = true
        return cover
    }()
    
    lazy var titleOfBook: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        return label
    }()
    
    lazy var authorOfBook: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func addViews() {
        [coverOfBook, titleOfBook, authorOfBook, rating].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        coverOfBook.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        coverOfBook.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        coverOfBook.widthAnchor.constraint(equalToConstant: 110).isActive = true
        coverOfBook.heightAnchor.constraint(equalToConstant: 155).isActive = true
        
        titleOfBook.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleOfBook.leadingAnchor.constraint(equalTo: coverOfBook.trailingAnchor, constant: 20).isActive = true
        titleOfBook.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        authorOfBook.topAnchor.constraint(equalTo: titleOfBook.bottomAnchor, constant: 10).isActive = true
        authorOfBook.leadingAnchor.constraint(equalTo: coverOfBook.trailingAnchor, constant: 20).isActive = true
        authorOfBook.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        rating.topAnchor.constraint(equalTo: authorOfBook.bottomAnchor, constant: 10).isActive = true
        rating.leadingAnchor.constraint(equalTo: coverOfBook.trailingAnchor, constant: 20).isActive = true
        rating.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }

}
