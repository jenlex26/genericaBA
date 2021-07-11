//
//  BAZHomeViewController.swift
//  AirBazGeneric
//
//  Created Usuario Phinder 2020 on 21/05/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit
import UserNotificationsUI
import WalletSDK
import CoreLocation

class BAZHomeViewController: UIViewController, BAZHomeViewProtocol {

    var presenter: BAZHomePresenterProtocol?
    
    //MARK: - @IBOutlets
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var menuStackView: UIStackView!
    @IBOutlet weak var payImage: UIImageView!
    @IBOutlet weak var payButton: UIButton!
    
    //MARK: - Properties
    var walletInit: WalletSDKInit?
    var submitAction: UIAlertAction!
    let env: AirbazEnviroment = .bazProd
    
    var loadingView: UIView = {
        let loadingView = UIView()
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = loadingView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadingView.addSubview(blurEffectView)
        
        loadingView.isUserInteractionEnabled = false
        
        return loadingView
    }()
    var activityIndicator: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        
        return spinner
    }()
    let locationManager = CLLocationManager()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    //MARK: - Methods
    private func setView() {
        passwordButton.layer.borderWidth = 4.0
        passwordButton.layer.borderColor = UIColor(red: 0.09, green: 0.58, blue: 0.28, alpha: 1.0).cgColor
        passwordButton.layer.cornerRadius = 35.0
        menuStackView.arrangedSubviews.forEach({ $0.layer.cornerRadius = $0.frame.width / 2 })
        
        getLocationPermissons()
    }
    
    func sendNotification(body: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.body = body

        let request = UNNotificationRequest(identifier: "testNotification",
                                            content: notificationContent,
                                            trigger: nil)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }
    
    deinit {
        walletInit?.stopOnline()
//        walletInit?.stopOffline()
    }
    
    //MARK: - @IBActions
    @IBAction func goToPayment(_ sender: UIButton) {
        let hasAlreadyLaunched = UserDefaults.standard.bool(forKey: "hasAlreadyLaunched")
        
        if hasAlreadyLaunched {
            if walletInit != nil {
                let view = WhereDoRouter.createModule()
                self.navigationController?.pushViewController(view, animated: true)
                return
            } else {
                
                initWallet()
                
                let view = WhereDoRouter.createModule()
                self.navigationController?.pushViewController(view, animated: true)
                return
            }
        }
        
        let alert = UIAlertController(title: "Agregue su nombre y su teléfono", message: nil, preferredStyle: .alert)
        
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        alert.addTextField()
        
        let nameField = alert.textFields![0]
        let apPatField = alert.textFields![1]
        let phoneField = alert.textFields![2]
        let accountNumberField = alert.textFields![3]
        
        nameField.placeholder = "Nombre"
        apPatField.placeholder = "Apellido Paterno"
        phoneField.placeholder = "Teléfono"
        accountNumberField.placeholder = "Número de Cuenta"
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .default) { [unowned alert] _ in
            alert.dismiss(animated: true)
        }
        
        let id: String = "\(Int.random(in: 1...1000))"
        UserDefaults.standard.setValue(750.00, forKey: "balance")
        UserDefaults.standard.setValue(id, forKey: "id")
        
        let submitAction = UIAlertAction(title: "Entrar", style: .default) { _ in
            
            let name = nameField.text ?? ""
            let apPat = apPatField.text ?? ""
            let phone = phoneField.text ?? ""
            let accountNumber = accountNumberField.text ?? ""
            
            if name.trimmingCharacters(in: .whitespacesAndNewlines) != "" && apPat.trimmingCharacters(in: .whitespacesAndNewlines) != "" &&
                phone.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                
                let fullName = name + " " + apPat
                
                UserDefaults.standard.setValue(true, forKey: "hasAlreadyLaunched")
                UserDefaults.standard.setValue(fullName, forKey: "name")
                UserDefaults.standard.setValue(phone, forKey: "phone")
                UserDefaults.standard.setValue(accountNumber, forKey: "accountNumber")
                
                let lat = UserDefaults.standard.double(forKey: "lat")
                let lng = UserDefaults.standard.double(forKey: "lng")
                let color = UIColor.hexStringToUIColor(hex: "#4EBC8A")
                
                self.walletInit = WalletSDKInit.shared
                
                self.walletInit!.setData(accountNumber: accountNumber, name: name, apPat: apPat, phone: phone, latitude: lat, longitude: lng, primaryColor: color, userColor: color, enviroment: self.env)
                
                self.walletInit!.showLocationText = true
                
                self.walletInit!.timeOut = 60

                let view = WhereDoRouter.createModule()
                self.navigationController?.pushViewController(view, animated: true)
            }
        }
        
        alert.addAction(cancelAction)
        alert.addAction(submitAction)
        present(alert, animated: true)
    }
    @IBAction func onClickPay(_ sender: UIButton) {
        self.getCountDevices()
    }
    
    @IBAction func onClickDelete(_ sender: Any) {
        self.deleteDevice()
    }
    
    @IBAction func onClickChangeAccount(_ sender: Any) {
        changeAccount(accountNumber: "1234567890")
    }
}

// MARK: - Location Delegate

extension BAZHomeViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("1. locations = \(locValue.latitude) \(locValue.longitude)")
        UserDefaults.standard.setValue(locValue.latitude, forKey: "lat")
        UserDefaults.standard.setValue(locValue.longitude, forKey: "lng")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("2. locations = \(locValue.latitude) \(locValue.longitude)")
        UserDefaults.standard.setValue(locValue.latitude, forKey: "lat")
        UserDefaults.standard.setValue(locValue.longitude, forKey: "lng")
    }
}
// MARK: - Private functions
extension BAZHomeViewController {
    private func getLocationPermissons(){

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestLocation()
            
        }
    }
    
    private func deleteDevice(){
        print("$$$$ DELETE $$$$$")
        walletInit = WalletSDKInit.shared
        
        if !walletInit!.isInitializated {
            initWallet()
        }
        
        showSpinner()
        
        walletInit!.deleteDevice {
            count  in
            
            DispatchQueue.main.async {
                self.hideSpinner()
                
                let alert = UIAlertController(title: "Device Delete Count", message: String(count ?? -1) , preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok", style: .default) { [unowned alert] _ in
                    alert.dismiss(animated: true)
                }
                
                alert.addAction(cancelAction)
                
                self.present(alert, animated: true)
            }
        }
    }
    
    private func getCountDevices(){
        print("$$$$ COUNT $$$$$")
        walletInit = WalletSDKInit.shared
        
        if !walletInit!.isInitializated {
            initWallet()
        }
        
        showSpinner()
        
        walletInit!.startDevice {
            count  in
            
            DispatchQueue.main.async {
                self.hideSpinner()
                
                let alert = UIAlertController(title: "Devices count", message: String(count ?? -1) , preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "Ok", style: .default) { [unowned alert] _ in
                    alert.dismiss(animated: true)
                }
                
                alert.addAction(cancelAction)
                
                self.present(alert, animated: true)
            }
        }
       
    }
    
    private func showSpinner(){
        self.view.addSubview(loadingView)
        loadingView.addSubview(activityIndicator)
        
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo:self.view.topAnchor),
            loadingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loadingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loadingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
    }
    
    private func hideSpinner(){
        self.view.isUserInteractionEnabled = true
        activityIndicator.stopAnimating()
        loadingView.removeFromSuperview()
        activityIndicator.removeFromSuperview()
    }
    
    private func initWallet(){
        
        let name = UserDefaults.standard.string(forKey: "name")!
        let nameSplit = name.split(separator: " ")
        let phone = UserDefaults.standard.string(forKey: "phone")!
        let accountNumber = UserDefaults.standard.string(forKey: "accountNumber")!
        let color = UIColor.hexStringToUIColor(hex: "#4EBC8A")
        let lat = UserDefaults.standard.double(forKey: "lat")
        let lng = UserDefaults.standard.double(forKey: "lng")
        
        self.walletInit = WalletSDKInit.shared
        
        self.walletInit!.setData(accountNumber: accountNumber, name: String(nameSplit[0]), apPat: String(nameSplit[1]), phone: phone, latitude: lat, longitude: lng, primaryColor: color, userColor: color,enviroment: env) 
        
        self.walletInit?.showLocationText = true
       
        
        self.walletInit!.timeOut = 60
    }
    
    private func changeAccount(accountNumber: String){
        walletInit?.changeAccountNumber(accountNumber: accountNumber)
    }
}
