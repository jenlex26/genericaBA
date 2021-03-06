//
//  WhereDoPresenter.swift
//  WalletSDK
//
//  Created Branchbit on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class WhereDoPresenter: WhereDoPresenterProtocol {

    weak private var view: WhereDoViewProtocol?
    var interactor: WhereDoInteractorProtocol?
    private let router: WhereDoWireframeProtocol

    init(interface: WhereDoViewProtocol, interactor: WhereDoInteractorProtocol?, router: WhereDoWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
