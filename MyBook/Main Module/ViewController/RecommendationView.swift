//
//  RecommendationView.swift
//  MyBook
//
//  Created by Madi Kupesov on 2/27/21.
//

import UIKit

class RecommendationView: UIStackView {

    lazy var logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "snowy-owl")
        return logo
    }()
    
    lazy var recommendationLabel: UILabel = {
        let label = UILabel()
        label.text = "Recommendations"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        [logo, recommendationLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        logo.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        logo.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        recommendationLabel.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 20).isActive = true
        recommendationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        recommendationLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
