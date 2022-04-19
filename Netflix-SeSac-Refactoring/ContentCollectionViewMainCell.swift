//
//  ContentCollectionViewRankCell.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/04/14.
//


import UIKit
import SnapKit

class ContentCollectionViewMainCell: UICollectionViewCell {
    
    let baseStackView = UIStackView()
    let menuStackView = UIStackView()
    
    let tvButton = UIButton()
    let movieButton = UIButton()
    let categoryButton = UIButton()
 
    let imageView = UIImageView()
    let discriptionLabel = UILabel()
    let contentStackView = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [baseStackView,menuStackView].forEach {
            contentView.addSubview($0)
        }
        
        baseStackView.axis = .horizontal
        baseStackView.alignment = .center
        baseStackView.distribution = .fillProportionally
        baseStackView.spacing = 5
        
        baseStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        [imageView,discriptionLabel,contentStackView].forEach {
            baseStackView.addArrangedSubview($0)
        }
        
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints {
            $0.width.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        discriptionLabel.font = .systemFont(ofSize: 13)
        discriptionLabel.textColor = .white
        discriptionLabel.sizeToFit()
        
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.distribution = .equalCentering
        contentStackView.spacing = 20
        
        contentStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
        
        menuStackView.axis = .horizontal
        menuStackView.alignment = .center
        menuStackView.distribution = .equalSpacing
        menuStackView.spacing = 20
        
        
        
        [tvButton,movieButton,categoryButton].forEach {
            menuStackView.addArrangedSubview($0)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 3
        }
        
        tvButton.setTitle("TV 프로그램", for: .normal)
        movieButton.setTitle("영화", for: .normal)
        categoryButton.setTitle("카테고리 ▼", for: .normal)
        
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(baseStackView)
            make.leading.trailing.equalToSuperview().inset(30)
        }
        
    }
    
}
