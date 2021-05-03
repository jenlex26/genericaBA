//
//  ViewAnimation.swift
//  AirBazGeneric
//
//  Created by Usuario Phinder 2020 on 30/04/21.
//

import UIKit

struct ViewAnimation {
    
    //MARK: - Properties
    let y: NSInteger
    let viewMove: UIView
    
    //MARK: - Init
    init(y: NSInteger, viewMove: UIView) {
        self.y = y
        self.viewMove = viewMove
    }
    
    //MARK: - Methods
    func animation() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.viewMove.frame.origin.y = CGFloat(self.y)
        }) { (Bool) in
            
        }
    }
    
}
