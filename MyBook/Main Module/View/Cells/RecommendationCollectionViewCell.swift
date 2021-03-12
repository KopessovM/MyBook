//
//  RecommendationCollectionViewCell.swift
//  MyBook
//
//  Created by Madi Kupesov on 2/27/21.
//

import UIKit

class RecommendationCollectionViewCell: UICollectionViewCell {
    
    lazy var recommendations: UIImageView = {
        let rec = UIImageView()
        rec.layer.cornerRadius = 5
        rec.layer.masksToBounds = true
        return rec
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func addViews() {
        self.addSubview(recommendations)
        recommendations.translatesAutoresizingMaskIntoConstraints = false
        
        recommendations.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        recommendations.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        recommendations.heightAnchor.constraint(equalToConstant: 155).isActive = true
        recommendations.widthAnchor.constraint(equalToConstant: 110).isActive = true
    }
    
    
    
}
