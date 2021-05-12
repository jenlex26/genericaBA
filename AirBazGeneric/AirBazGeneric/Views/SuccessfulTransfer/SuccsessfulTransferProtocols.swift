//
//  SuccsessfulTransferProtocols.swift
//  WalletSDK
//
//  Created Usuario Phinder 2020 on 03/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol SuccsessfulTransferWireframeProtocol: class {

}

//MARK: Presenter -
protocol SuccsessfulTransferPresenterProtocol: class {

}

//MARK: Interactor -
protocol SuccsessfulTransferInteractorProtocol: class {
    
    var presenter: SuccsessfulTransferPresenterProtocol?  { get set }
}

//MARK: View -
protocol SuccsessfulTransferViewProtocol: class {
    
    var presenter: SuccsessfulTransferPresenterProtocol?  { get set }
}