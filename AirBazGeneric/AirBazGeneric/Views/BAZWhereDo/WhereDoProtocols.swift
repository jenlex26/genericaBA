//
//  WhereDoProtocols.swift
//  WalletSDK
//
//  Created Branchbit on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol WhereDoWireframeProtocol: AnyObject {

}

//MARK: Presenter -
protocol WhereDoPresenterProtocol: AnyObject {

}

//MARK: Interactor -
protocol WhereDoInteractorProtocol: AnyObject {
    
    var presenter: WhereDoPresenterProtocol?  { get set }
}

//MARK: View -
protocol WhereDoViewProtocol: AnyObject {
    
    var presenter: WhereDoPresenterProtocol?  { get set }
}
