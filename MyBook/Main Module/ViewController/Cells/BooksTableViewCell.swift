//
//  BooksTableViewCell.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/3/21.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    lazy var nameOfBook: UILabel = {
        let label = UILabel()
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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func addViews() {
        self.addSubview(nameOfBook)
        nameOfBook.translatesAutoresizingMaskIntoConstraints = false
        
        nameOfBook.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        nameOfBook.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        nameOfBook.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

}
