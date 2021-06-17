//
//  StringExtension.swift
//  AirBazGeneric
//
//  Created by Usuario Phinder 2020 on 20/05/21.
//

import UIKit

extension String {
    func priceStyle(fontSize: CGFloat, weight: UIFont.Weight) -> NSMutableAttributedString {
        let numberFont = UIFont.systemFont(ofSize: fontSize, weight: weight)
        let decimalsFont = UIFont.systemFont(ofSize: fontSize - 8.0, weight: weight)
        let stylizedPrice = NSMutableAttributedString(string: self, attributes: [.font: numberFont])
        
        var changeRange = NSString(string: self).range(of: ".")
        changeRange.location += 1
        changeRange.length = self.count - changeRange.location
        
        let offset = numberFont.capHeight - decimalsFont.capHeight
        stylizedPrice.addAttribute(.font, value: decimalsFont, range: changeRange)
        stylizedPrice.addAttribute(.baselineOffset, value: offset, range: changeRange)
        return stylizedPrice
    }
    
    func currencyInputFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2

        var amountWithPrefix = self

        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")

        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))

        guard number != 0 as NSNumber else {
            return ""
        }

        return formatter.string(from: number)!
    }
}
