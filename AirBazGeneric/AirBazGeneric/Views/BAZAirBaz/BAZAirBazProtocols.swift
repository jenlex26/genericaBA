//
//  BAZAirBazProtocols.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol BAZAirBazWireframeProtocol: class {

}
//MARK: Presenter -
protocol BAZAirBazPresenterProtocol: class {

}

//MARK: Interactor -
protocol BAZAirBazInteractorProtocol: class {

  var presenter: BAZAirBazPresenterProtocol?  { get set }
}

//MARK: View -
protocol BAZAirBazViewProtocol: class {

  var presenter: BAZAirBazPresenterProtocol?  { get set }
}
