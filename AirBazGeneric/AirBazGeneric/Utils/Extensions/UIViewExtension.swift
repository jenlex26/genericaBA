//
//  UIViewExtension.swift
//  AirBazGeneric
//
//  Created by Usuario Phinder 2020 on 30/04/21.
//

import UIKit

extension UIView {    
    func setCorner(cornerRadius: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    func addShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: 0.3, height: 0.5)
        self.layer.shadowRadius = 10.0
    }
    
    func roundCorners(corners: CACornerMask, cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = corners
        }
    }
}
