//
//  TextField.swift
//  AirBazGeneric
//
//  Created by Usuario Phinder 2020 on 30/04/21.
//

import UIKit

public class TextField: UITextField {

    //MARK: - @IBInspectable
    @IBInspectable var placeholderText: String!
    
    //MARK: - Properties
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 18)
    
    //MARK: - Life cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        changePlaceholder()
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    //MARK: - Methods
    private func commonInit() {
        self.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        self.borderStyle = .none
        self.setCorner(cornerRadius: 10.0)
    }
    
    private func changePlaceholder() {
        let placeholderString = NSAttributedString(string: placeholderText,
                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        
        self.attributedPlaceholder = placeholderString
    }
}

