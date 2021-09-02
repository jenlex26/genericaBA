//
//  BAZPaymentRouter.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import AirBaz

class BAZPaymentRouter: BAZPaymentWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = BAZPaymentViewController(nibName: "BAZPaymentViewController", bundle: nil)
        let interactor = BAZPaymentInteractor()
        let router = BAZPaymentRouter()
        let presenter = BAZPaymentPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
