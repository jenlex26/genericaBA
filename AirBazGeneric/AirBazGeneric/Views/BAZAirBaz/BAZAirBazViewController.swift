//
//  BAZAirBazViewController.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import WalletSDK

class BAZAirBazViewController: UIViewController, BAZAirBazViewProtocol {

	var presenter: BAZAirBazPresenterProtocol?

    //MARK: - @IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var stepViewWidth: NSLayoutConstraint!
    
    //MARK: - Properties
    var walletInit: WalletSDKInit = WalletSDKInit.shared
    
    //MARK: - Life cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateStepView()
    }
    //MARK: - Methods
    private func setView() {
        let airBazView = walletInit.renderRadar(delegate: self)
        
        addChild(airBazView)
        airBazView.view.frame = containerView.bounds
        containerView.addSubview(airBazView.view)
//        walletInit.stopOnline()
    }
    
    private func animateStepView() {
        view.layoutIfNeeded()
        stepViewWidth.constant = self.view.frame.width * 0.25
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        })
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func root(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}

//MARK: - WalletSDKDelegate
extension BAZAirBazViewController: WalletSDKDelegate {

    func sucessAtFindingDevice(name: String, apPat: String, phone: String,  accountNumber: String) {
        let completeName = name + " " + apPat
        UserDefaults.standard.setValue(completeName, forKey: "destinationName")
        UserDefaults.standard.setValue(accountNumber, forKey: "destinationNumber")
        UserDefaults.standard.setValue(phone, forKey: "destinationPhoneNumber")
        
        let view = BAZPaymentRouter.createModule()
        self.navigationController?.pushViewController(view, animated: true)
    }
}
