//
//  TransferInteractor.swift
//  WalletSDK
//
//  Created Usuario Phinder 2020 on 03/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import Alamofire

class TransferInteractor: TransferInteractorProtocol {

    weak var presenter: TransferPresenterProtocol?
    
    //MARK: - Properties
    private var isAmountEmpty: Bool = false {
        didSet { presenter?.amountIsEmpty(isAmountEmpty)}
    }
    
    func checkTextField(amount: String?) {
        isAmountEmpty = amount != "" ? false : true
        
        if !isAmountEmpty {
            presenter?.isTextFieldWithText(amount: amount!)
        }
    }
    
    func makeTransfer(amount: String, accountToTransfer: String, myAccountNumber: String) {
        let url = "https://dev-captacion.bienestarazteca.com/captacion/traspaso"
        let doubleAmount = Double(amount)!
        let formattedAmount: String = String(format: "%016.2f", doubleAmount)
        let parameters: [String: Any] = ["monto": formattedAmount,
                                         "cuentaOperacionRetiro": myAccountNumber,
                                         "codigoDivisa": "MXP",
                                         "codigoOperacionDeposito": "160",
                                         "descripcionOperacionRetiro": "RETIRO PRUEBA AIRBAZ",
                                         "cuentaOperacionDeposito": accountToTransfer,
                                         "descripcionOperacionDeposito": "DESPOSITO PRUEBA AIRBAZ",
                                         "codigoOperacionRetiro": "169",
                                         "campoLibre": ""]
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        
        let headers: HTTPHeaders = ["Content-Type": "application/json",
                                    "X-Custom-Header": "application/json;charset=UTF-8"]
        
        manager.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON {
            [weak self] (response) in
            guard let self = self else { return }
            
            switch response.result {
            case .success:
                if response.response?.statusCode == 200, let data = response.data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String: Any]
                        if let message = json?["mensaje"] as? String, message == "Operacion exitosa." {
                            self.presenter?.isTransferCorrect(amount: amount)
                        } else {
                            self.presenter?.isTransferIncorrect()
                        }
                    } catch {
                        self.presenter?.isTransferIncorrect()
                    }
                } else {
                    self.presenter?.isTransferIncorrect()
                }
            case .failure:
                self.presenter?.isTransferIncorrect()
            @unknown default:
                break
            }
        }
    }
}
