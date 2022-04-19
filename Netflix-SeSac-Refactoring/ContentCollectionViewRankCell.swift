//
//  ContentCollectionRankCell.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/04/19.
//

import UIKit
import SnapKit

class ContentCollectionViewRankCell: UICollectionViewCell {
 
    let imageView = UIImageView()
    let rankLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFit
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        rankLabel.font = .systemFont(ofSize: 100, weight: .black)
        rankLabel.textColor = .white
        contentView.addSubview(rankLabel)
        rankLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview().offset(25)
        }
    }
    
    
}
