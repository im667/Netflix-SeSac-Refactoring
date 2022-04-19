//
//  UIButton.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/04/20.
//


import UIKit

extension UIButton {
    func adjustVerticalLayout(_ spacing: CGFloat = 0) {
        let imageSize = self.imageView?.frame.size ?? .zero
        let titleLabelSize = self.titleLabel?.frame.size ?? .zero
        
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width, bottom: -(imageSize.height + spacing), right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleLabelSize.height + spacing), left: 0, bottom: 0, right: CGFloat(-titleLabelSize.width))
    }
}
