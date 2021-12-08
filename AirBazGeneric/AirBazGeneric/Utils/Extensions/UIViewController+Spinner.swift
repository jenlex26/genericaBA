//
//  UIViewController+Spinner.swift
//  AirBazGeneric
//
//  Created by Alejandro on 25/11/21.
//

import UIKit


extension UIViewController {
    static func showSpinner() {
        guard let window = UIApplication.shared.keyWindow else { return }
        
        
        let loadingView = Spinner(frame: UIScreen.main.bounds)
        
        window.addSubview(loadingView)
        window.bringSubviewToFront(loadingView)
    }
    
    static func hideSpinner() {
        guard let window = UIApplication.shared.keyWindow,
              let spinner = window.subviews.first(where: {$0 is Spinner }) else {
            return
        }
        
        spinner.removeFromSuperview()
    }
}
