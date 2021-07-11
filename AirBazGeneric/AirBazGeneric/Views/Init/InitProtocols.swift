//
//  InitProtocols.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 05/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol InitWireframeProtocol: AnyObject {

}

//MARK: Presenter -
protocol InitPresenterProtocol: AnyObject {

}

//MARK: Interactor -
protocol InitInteractorProtocol: AnyObject {
    
    var presenter: InitPresenterProtocol?  { get set }
}

//MARK: View -
protocol InitViewProtocol: AnyObject {
    
    var presenter: InitPresenterProtocol?  { get set }
}
