//
//  SuccsessfulTransferPresenter.swift
//  WalletSDK
//
//  Created Usuario Phinder 2020 on 03/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SuccsessfulTransferPresenter: SuccsessfulTransferPresenterProtocol {

    weak private var view: SuccsessfulTransferViewProtocol?
    var interactor: SuccsessfulTransferInteractorProtocol?
    private let router: SuccsessfulTransferWireframeProtocol

    init(interface: SuccsessfulTransferViewProtocol, interactor: SuccsessfulTransferInteractorProtocol?, router: SuccsessfulTransferWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
