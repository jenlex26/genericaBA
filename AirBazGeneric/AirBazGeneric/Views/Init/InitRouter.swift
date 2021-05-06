//
//  InitRouter.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 05/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class InitRouter: InitWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(name: String, apPat: String, accountNumber: String, color: Color) -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
        let view = InitViewController(nibName: "InitViewController", bundle: nil)
        view.name = name
        view.apPat = apPat
        view.accountNumber = accountNumber
        view.color = color
        
        let interactor = InitInteractor()
        let router = InitRouter()
        let presenter = InitPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
