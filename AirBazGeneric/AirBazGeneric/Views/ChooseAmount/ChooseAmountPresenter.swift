//
//  ChooseAmountPresenter.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 20/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ChooseAmountPresenter: ChooseAmountPresenterProtocol {

    weak private var view: ChooseAmountViewProtocol?
    var interactor: ChooseAmountInteractorProtocol?
    private let router: ChooseAmountWireframeProtocol

    init(interface: ChooseAmountViewProtocol, interactor: ChooseAmountInteractorProtocol?, router: ChooseAmountWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
