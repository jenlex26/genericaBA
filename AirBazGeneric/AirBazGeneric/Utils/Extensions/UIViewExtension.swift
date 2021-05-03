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
    
}
