//
//  UIColorExtension.swift
//  AirBazGeneric
//
//  Created by Usuario Phinder 2020 on 05/05/21.
//

import UIKit

extension UIColor {
    static func hexStringToUIColor(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            return UIColor(
                red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                alpha: CGFloat(1.0)
            )
        } else if ((cString.count) == 8) {
            var rgbValue:UInt32 = 0
            let alpha = cString.dropFirst(2)
            let colors = cString.dropLast(6)
            cString = "\(colors)\(alpha)"
            Scanner(string: cString).scanHexInt32(&rgbValue)
            return UIColor(
                red: CGFloat((rgbValue & 0xFF000000) >> 24) / 255.0,
                green: CGFloat((rgbValue & 0x00FF0000) >> 16) / 255.0,
                blue: CGFloat((rgbValue & 0x0000FF00) >> 8) / 255.0,
                alpha: CGFloat(rgbValue & 0x000000FF) / 255.0
            )
        } else {
            return UIColor.lightGray
        }
    }
    
    var randomColor: UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5
                    
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
    
}
