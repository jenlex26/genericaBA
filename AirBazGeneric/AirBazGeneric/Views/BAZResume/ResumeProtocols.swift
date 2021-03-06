//
//  ResumeProtocols.swift
//  AirBazGeneric
//
//  Created Branchbit on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol ResumeWireframeProtocol: AnyObject {

}

//MARK: Presenter -
protocol ResumePresenterProtocol: AnyObject {

}

//MARK: Interactor -
protocol ResumeInteractorProtocol: AnyObject {
    
    var presenter: ResumePresenterProtocol?  { get set }
}

//MARK: View -
protocol ResumeViewProtocol: AnyObject {
    
    var presenter: ResumePresenterProtocol?  { get set }
}
