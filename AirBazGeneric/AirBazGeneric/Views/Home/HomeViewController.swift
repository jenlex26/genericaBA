//
//  HomeViewController.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 20/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {

	var presenter: HomePresenterProtocol?
    
    //MARK: - @IBOutlets
    @IBOutlet weak var headerView: UIView!

    //MARK: - Life cycle
	override func viewDidLoad() {
        super.viewDidLoad()
    }

}
