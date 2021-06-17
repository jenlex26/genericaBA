//
//  CustomTabController.swift
//  AirBazGeneric
//
//  Created by Usuario Phinder 2020 on 20/05/21.
//

import UIKit

class CustomTabController: UITabBarController {

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setValue(CustomTabBar(frame: self.tabBar.frame), forKey: "tabBar")
        self.tabBar.tintColor = UIColor(red: 0.48, green: 0.81, blue: 0.40, alpha: 1.00)
        
        let home = HomeRouter.createModule()
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home")!, tag: 1)
        let nav1 = UINavigationController(rootViewController: home)
        nav1.isNavigationBarHidden = true

        let menu = MenuRouter.createModule()
        menu.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "menu")!, tag: 1)
        let nav2 = UINavigationController(rootViewController: menu)
        nav2.isNavigationBarHidden = true

        viewControllers = [nav1, nav2]
        setMiddleButton()
    }

    //MARK: - Methods
    private func setMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height - 50
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame

        menuButton.backgroundColor = UIColor(red: 0.48, green: 0.81, blue: 0.40, alpha: 1.00)
        menuButton.layer.cornerRadius = menuButtonFrame.height / 2
        view.addSubview(menuButton)

        menuButton.setImage(UIImage(named: "airbazIcon"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)

        view.layoutIfNeeded()
    }


    // MARK: - Actions
    @objc private func menuButtonAction(sender: UIButton) {
        
    }

}
