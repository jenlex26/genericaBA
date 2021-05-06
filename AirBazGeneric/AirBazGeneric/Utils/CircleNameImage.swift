//
//  CircleNameImage.swift
//  AirBazGeneric
//
//  Created by Usuario Phinder 2020 on 05/05/21.
//

import UIKit

class CircleNameImage {
    
    static func create(name: String, apPat: String, color: UIColor? = .black) -> UIImage? {
        let nameLabel = UILabel()
        var text = String()
        
        nameLabel.frame.size = CGSize(width: 100.0, height: 100.0)
        nameLabel.font = UIFont(name: "Avenir-Black", size: 25.0)
        nameLabel.textColor = UIColor.white
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = color
        
        if name != "" {
            let nameCharacter = String(name.first!).capitalized
            if apPat != "" {
                let apPatCharacter = String(apPat.first!).capitalized
                text =  nameCharacter + apPatCharacter
            } else {
                text = nameCharacter
            }
        } else {
            text = "NA"
        }
        
        nameLabel.text = text

        UIGraphicsBeginImageContext(nameLabel.bounds.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        nameLabel.layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image.circle
    }
}
