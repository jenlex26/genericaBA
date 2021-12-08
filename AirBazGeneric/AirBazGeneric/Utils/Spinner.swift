//
//  Spinner.swift
//  AirBazGeneric
//
//  Created by Alejandro on 25/11/21.
//

import UIKit

final class Spinner: UIView {
    //MARK: - Properties
    private let activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        
        return spinner
    }()
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
        setupContraints()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        activityIndicator.startAnimating()
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        
        activityIndicator.stopAnimating()
    }
}

//MARK: - Private functions
extension Spinner {
    private func setupUI() {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
        
        self.isUserInteractionEnabled = false
    }
    
    private func setupContraints() {
        self.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
