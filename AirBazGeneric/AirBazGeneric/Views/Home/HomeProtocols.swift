//
//  HomeProtocols.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 20/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol HomeWireframeProtocol: AnyObject {

}

//MARK: Presenter -
protocol HomePresenterProtocol: AnyObject {

}

//MARK: Interactor -
protocol HomeInteractorProtocol: AnyObject {
    
    var presenter: HomePresenterProtocol?  { get set }
}

//MARK: View -
protocol HomeViewProtocol: AnyObject {
    
    var presenter: HomePresenterProtocol?  { get set }
}
