//
//  BAZAirBazPresenter.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class BAZAirBazPresenter: BAZAirBazPresenterProtocol {

    weak private var view: BAZAirBazViewProtocol?
    var interactor: BAZAirBazInteractorProtocol?
    private let router: BAZAirBazWireframeProtocol

    init(interface: BAZAirBazViewProtocol, interactor: BAZAirBazInteractorProtocol?, router: BAZAirBazWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}