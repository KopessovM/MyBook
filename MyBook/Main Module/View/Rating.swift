//
//  Rating.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/10/21.
//

import UIKit

class Rating: UIStackView {

    lazy var stars1: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(named: "star.filled")
        return star
    }()
    lazy var stars2: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(named: "star.filled")
        return star
    }()
    lazy var stars3: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(named: "star.filled")
        return star
    }()
    lazy var stars4: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(named: "star.filled")
        return star
    }()
    lazy var stars5: UIImageView = {
        let star = UIImageView()
        star.image = UIImage(named: "star.filled")
        return star
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        [stars1, stars2, stars3, stars4, stars5].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        stars1.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stars1.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stars1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stars1.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        stars2.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stars2.leadingAnchor.constraint(equalTo: stars1.trailingAnchor, constant: 5).isActive = true
        stars2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stars2.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        stars3.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stars3.leadingAnchor.constraint(equalTo: stars2.trailingAnchor, constant: 5).isActive = true
        stars3.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stars3.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        stars4.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stars4.leadingAnchor.constraint(equalTo: stars3.trailingAnchor, constant: 5).isActive = true
        stars4.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stars4.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        stars5.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stars5.leadingAnchor.constraint(equalTo: stars4.trailingAnchor, constant: 5).isActive = true
        stars5.heightAnchor.constraint(equalToConstant: 20).isActive = true
        stars5.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
