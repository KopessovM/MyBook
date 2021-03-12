//
//  Recommendation.swift
//  MyBook
//
//  Created by Madi Kupesov on 3/3/21.
//

import UIKit

class Recommendation: UIView {
    
    var recommendationBooksImages = ["Catcher Rye", "Digital Fortress", "Dorian Gray"]
    var logoAndLabel = RecommendationView()
    
    lazy var books: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 110, height: 155)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        
        let myCollectionView = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        myCollectionView.register(RecommendationCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.backgroundColor = UIColor(red: 192, green: 191, blue: 221)
        myCollectionView.bounces = true
        return myCollectionView
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        [logoAndLabel, books].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        logoAndLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        logoAndLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logoAndLabel.heightAnchor.constraint(equalToConstant: 95).isActive = true
        
        books.topAnchor.constraint(equalTo: logoAndLabel.bottomAnchor, constant: 20).isActive = true
        books.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        books.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        books.heightAnchor.constraint(equalToConstant: 155).isActive = true
    
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Recommendation: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recommendationBooksImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? RecommendationCollectionViewCell
        cell?.recommendations.image = UIImage(named: recommendationBooksImages[indexPath.row])
        return cell!
    }

}
