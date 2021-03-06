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
protocol SuccsessfulTransferWireframeProtocol: AnyObject {

}

//MARK: Presenter -
protocol SuccsessfulTransferPresenterProtocol: AnyObject {

}

//MARK: Interactor -
protocol SuccsessfulTransferInteractorProtocol: AnyObject {
    
    var presenter: SuccsessfulTransferPresenterProtocol?  { get set }
}

//MARK: View -
protocol SuccsessfulTransferViewProtocol: AnyObject {
    
    var presenter: SuccsessfulTransferPresenterProtocol?  { get set }
}
