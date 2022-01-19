//
//  ViewController.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 19.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let backgroundImageView = UIImageView()

    let backgroundImage = UIImage(named: "Background")
    
    let backButton = UIButton(type: .system)
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        title = "Личные задания"
        let textAttributes = [NSAttributedString.Key.foregroundColor: Colors.textColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.layer.cornerRadius = 25
        navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.addShadow()
        
        backButton.setImage(UIImage(named: "BackImage"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
       
        
        navigationController?.navigationBar.tintColor = Colors.textColor
        
        
        setUpViews()
        setUpConstraints()
       
    
        
        
    }
    
    
    
    func setUpViews() {
        
        
       
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = Colors.textColor
        
        
        
        backgroundImageView.image = backgroundImage
        view.addSubview(backgroundImageView)
        
        
        
        
    }

    
    
    func setUpConstraints() {
        
        backgroundImageView.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalToSuperview()
            
            
            
            
        }
        
    }

}
extension UIView {
func addShadow(shadowColor: CGColor = Colors.shadowColor.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
               shadowOpacity: Float = 0.2,
               shadowRadius: CGFloat = 2) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.masksToBounds = false
    }
    
    func addShadow2(shadowColor: CGColor = Colors.shadowColor.cgColor,
                       shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                       shadowOpacity: Float = 0.1,
                       shadowRadius: CGFloat = 1.0) {
            layer.shadowColor = shadowColor
            layer.shadowOffset = shadowOffset
            layer.shadowOpacity = shadowOpacity
            layer.shadowRadius = shadowRadius
            layer.masksToBounds = false
        }
    
    
}

