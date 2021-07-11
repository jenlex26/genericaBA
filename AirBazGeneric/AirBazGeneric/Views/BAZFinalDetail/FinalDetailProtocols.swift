//
//  FinalDetailProtocols.swift
//  AirBazGeneric
//
//  Created Branchbit on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol FinalDetailWireframeProtocol: AnyObject {

}

//MARK: Presenter -
protocol FinalDetailPresenterProtocol: AnyObject {

}

//MARK: Interactor -
protocol FinalDetailInteractorProtocol: AnyObject {
    
    var presenter: FinalDetailPresenterProtocol?  { get set }
}

//MARK: View -
protocol FinalDetailViewProtocol: AnyObject {
    
    var presenter: FinalDetailPresenterProtocol?  { get set }
}
