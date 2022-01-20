//
//  TabbarViewController.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 19.01.2022.
//

import UIKit

class TabbarViewController: UIViewController {

    let tabBarVC = UITabBarController()
    var customTabBarView = UIView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpTabbar()
    
        
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           self.setupCustomTabBarFrame()
       }

    func setUpTabbar() {
        
        let vc1 = UINavigationController(rootViewController: ViewController())
        vc1.title = "Главная"
        let vc2 =  UINavigationController(rootViewController: FeedViewController())
        vc2.title = "Лента"
        let vc3 = UINavigationController(rootViewController: TasksViewController())
        vc3.title = "Задания"
        let vc4 = UINavigationController(rootViewController: StoreViewController())
        vc4.title = "Магазин"
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
        vc5.title = "Профиль"
        
        [vc1,vc2,vc3,vc4,vc5].forEach { vc in
            
            let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)]
            vc.navigationBar.titleTextAttributes = textAttributes
          

            vc.navigationBar.setBackgroundImage(UIImage(), for: .default)
            vc.navigationBar.shadowImage = UIImage()
            vc.navigationBar.isTranslucent = true
            
            
        }
        
        
        
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.tintColor = Colors.tabBar
        tabBarVC.tabBar.barTintColor = .white
        tabBarVC.tabBar.layer.cornerRadius = 25
        tabBarVC.tabBar.addShadow2()
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
        tabBarVC.selectedIndex = 0
        
        guard let items = tabBarVC.tabBar.items else {
            
            return
            
        }
        
        let images = ["Main", "Feed", "Tasks", "Store", "Profile"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(named: images[x])
        }
        
        addCustomTabBarView()
        
    }
    
    private func setupCustomTabBarFrame() {
            let height = self.view.safeAreaInsets.bottom + 64
            
            var tabFrame = self.tabBarVC.tabBar.frame
            tabFrame.size.height = height
            tabFrame.origin.y = self.view.frame.size.height - height
            
            self.tabBarVC.tabBar.frame = tabFrame
            self.tabBarVC.tabBar.setNeedsLayout()
            self.tabBarVC.tabBar.layoutIfNeeded()
            customTabBarView.frame = tabBarVC.tabBar.frame
        }
    
    private func addCustomTabBarView() {
        
            self.customTabBarView.frame = tabBarVC.tabBar.frame
            
            self.customTabBarView.backgroundColor = .white
            self.customTabBarView.layer.cornerRadius = 30
            self.customTabBarView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

            self.customTabBarView.layer.masksToBounds = false
            self.customTabBarView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
            self.customTabBarView.layer.shadowOffset = CGSize(width: -4, height: -6)
            self.customTabBarView.layer.shadowOpacity = 0.5
            self.customTabBarView.layer.shadowRadius = 20
            
            self.view.addSubview(customTabBarView)
            self.view.bringSubviewToFront(self.tabBarVC.tabBar)
        }

}
