//
//  ViewController.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/04/08.
//

import UIKit
#if canImport(SwiftUI) && DEBUG
import SwiftUI
@available(iOS 13.0, *)

class MainViewController: UIViewController {

    var contents : [Content] = []
    var mainView = MainView()
    
    
    //#imageLiteral
    let netflixIcon = #imageLiteral(resourceName: "netflix_icon")
    
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting nav
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.hidesBarsOnSwipe = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: netflixIcon, style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.crop.circle"), style: .plain, target: nil, action: nil)
     
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        //DATA SETTING & GET
        contents = getContent()
        
        
        mainView.collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: "ContentCollectionViewCell")
        mainView.collectionView.register(ContentCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ContentCollectionViewHeader")

     
        
    }

    func getContent()->[Content] {
        guard let path = Bundle.main.path(forResource: "Content", ofType: "plist"),
              let data = FileManager.default.contents(atPath: path),
              let list = try? PropertyListDecoder().decode([Content].self, from: data) else { return [] }
                
                return list
    }
    
    
    
}
//:UICollectionViewDelegate,UICollectionViewDataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        
        default:
            return contents[section].contentItem.count
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch contents[indexPath.section].sectionType {
            
        case .basic, .large :
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
            
            cell.imageView.image = contents[indexPath.section].contentItem[indexPath.row].image
            return cell
            
        default :
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contents.count
    }
    
    //셀 선택
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionName = contents[indexPath.section].sectionName
        print("TEST:\(sectionName) 섹션의 \(indexPath.row + 1) 번째 콘텐츠")
    }
    
    //헤더뷰 설정
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ContentCollectionViewHeader", for: indexPath) as? ContentCollectionViewHeader else { fatalError("Could not dequeue Header") }
            
            headerView.sectionNameLabel.text = contents[indexPath.section].sectionName
            return headerView
        } else {
            return UICollectionReusableView()
        }
    }
    
    struct MainViewController_Previews:PreviewProvider{
        
        static var previews: some View {
            container().edgesIgnoringSafeArea(.all)
        }
        
        struct container: UIViewControllerRepresentable {
            func makeUIViewController(context: Context) -> UIViewController {
                let mainViewController = MainViewController()
                return UINavigationController(rootViewController: mainViewController)
            }
            
            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
                
            }
            
            typealias UIViewControllerType = UIViewController
        }
        
    }
    
}
#endif
