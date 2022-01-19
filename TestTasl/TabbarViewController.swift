//
//  TabbarViewController.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 19.01.2022.
//

import UIKit

class TabbarViewController: UIViewController {

    let tabBarVC = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabbar()
    }
    

    func setUpTabbar() {
        
        let vc1 = UINavigationController(rootViewController: ViewController())
        vc1.title = "News"
        let vc2 =  UINavigationController(rootViewController: FeedViewController())
        vc2.title = "Classes"
        let vc3 = UINavigationController(rootViewController: TasksViewController())
        vc3.title = "Scan"
        let vc4 = UINavigationController(rootViewController: StoreViewController())
        vc4.title = "Grades"
        let vc5 = UINavigationController(rootViewController: ProfileViewController())
        vc5.title = "Profile"
        
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
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: true, completion: nil)
        tabBarVC.selectedIndex = 0
        
        guard let items = tabBarVC.tabBar.items else {
            
            return
            
        }
        
        let images = ["News", "Classes", "Scan", "Grades", "Profile"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(named: images[x])
        }
        
              
        
    }

}
