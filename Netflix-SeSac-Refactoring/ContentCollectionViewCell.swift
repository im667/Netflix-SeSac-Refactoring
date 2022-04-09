//
//  ContentCollectionViewCell.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/04/09.
//

import UIKit
import SnapKit

class ContentCollectionViewCell : UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
}
