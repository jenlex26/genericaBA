//
//  MenuPresenter.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 20/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MenuPresenter: MenuPresenterProtocol {

    weak private var view: MenuViewProtocol?
    var interactor: MenuInteractorProtocol?
    private let router: MenuWireframeProtocol

    init(interface: MenuViewProtocol, interactor: MenuInteractorProtocol?, router: MenuWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
