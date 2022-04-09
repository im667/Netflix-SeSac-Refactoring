//
//  ViewController.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/04/08.
//

import UIKit

class MainViewController: UICollectionViewController {

    var contents : [Content] = []
    
    //#imageLiteral
    let netflixIcon = #imageLiteral(resourceName: "netflix_icon")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting nav
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnSwipe = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: netflixIcon, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
    
        
        //DATA SETTING & GET
        contents = getContent()
        
        
        //CollectionView Item(Cell) SETTING
        
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "ContentCollectionViewCell")
        
    }

    func getContent()->[Content] {
        guard let path = Bundle.main.path(forResource: "Content", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let list = try? PropertyListDecoder().decode([Content].self, from: data) else { return [] }
                
                return list
    }
}
//:UICollectionViewDelegate,UICollectionViewDataSource
extension MainViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        
        default:
            return contents[section].contentItem.count
            
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch contents[indexPath.section].sectionType {
            
        case .basic, .large :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
            
            cell.imageView.image = contents[indexPath.section].contentItem[indexPath.row].image
            return cell
            
        default :
            return UICollectionViewCell()
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contents.count
    }
    
    //셀 선택
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = contents[indexPath.section].sectionName
        print("TEST:\(sectionName) 섹션의 \(indexPath.row + 1) 번째 콘텐츠")
    }
    
    
}