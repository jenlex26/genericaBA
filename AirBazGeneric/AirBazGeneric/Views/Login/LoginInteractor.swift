//
//  LoginInteractor.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 30/04/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginInteractor: LoginInteractorProtocol {

    weak var presenter: LoginPresenterProtocol?
    
    //MARK: - Properties
    private var isNameEmpty: Bool = false {
        didSet { presenter?.nameIsEmpty(isNameEmpty) }
    }
    
    private var surnameIsEmpty: Bool = false {
        didSet { presenter?.surnameIsEmpty(surnameIsEmpty) }
    }
    
    private var isAccountNumber: Bool = false {
        didSet { presenter?.accountNumberIsEmpty(isAccountNumber) }
    }
    
    func checkTextFields(nameText: String?, surnameText: String?, accountNumber: String?) {
        isNameEmpty = nameText != "" ? false : true
        surnameIsEmpty = surnameText != "" ? false : true
        isAccountNumber = accountNumber != "" ? false : true
        
        if !isNameEmpty && !surnameIsEmpty && !isAccountNumber {
            presenter?.areTextFieldsWithText(name: nameText!, surname: surnameText!, accountNumber: accountNumber!)
        }
    }
}
