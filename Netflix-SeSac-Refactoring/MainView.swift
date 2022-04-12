//
//  MainView.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/04/12.
//

import Foundation

import UIKit

class MainView : UIView {
 
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        configure()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(){
         collectionView.backgroundColor = .white
        
    }
    
    func setupConstraints(){
       
     
        addSubview(collectionView)
        
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        func flowLayout() {
                let layout = UICollectionViewFlowLayout()
                let spacing: CGFloat = 8
                let width = UIScreen.main.bounds.width - (spacing * 4)
                let height = UIScreen.main.bounds.height - (spacing * 5)
                layout.itemSize = CGSize(width: width / 3, height: height / 4 )
                layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
                layout.minimumInteritemSpacing = spacing
                layout.minimumLineSpacing = spacing
                layout.scrollDirection = .vertical
                collectionView.collectionViewLayout = layout
            }
    
  }
}
