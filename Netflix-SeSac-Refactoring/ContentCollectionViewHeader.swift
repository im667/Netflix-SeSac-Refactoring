//
//  ContentCollectionViewHeader.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/04/09.
//

import UIKit
import SnapKit


class ContentCollectionViewHeader : UICollectionReusableView {
    
    static let identifier = "ContentCollectionViewHeader"
    
    let sectionNameLabel = UILabel()

    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        sectionNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        sectionNameLabel.textColor = .white
        sectionNameLabel.sizeToFit()
        addSubview(sectionNameLabel)
        
        
        sectionNameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.top.bottom.leading.equalToSuperview().offset(10)
        }
    }
    
    
}
