//
//  ViewController.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 19.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    
    let buttonsArray = [ButtonsModel(titleText: "Обучение"), ButtonsModel(titleText: "Задания")]
    
    let tutorialButton = UIButton(type: .system)
    
    let tasksButton = UIButton(type: .system)
    
    lazy var buttonsStackView = UIStackView(arrangedSubviews: [tutorialButton, tasksButton])
    
    let backgroundImageView = UIImageView()

    let backgroundImage = UIImage(named: "Background")
    
    let backButton = UIButton(type: .system)
    
    var colCell : CollectionViewCell?
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.allowsMultipleSelection = false
        cv.isUserInteractionEnabled = true
        cv.backgroundColor = .clear
        cv.isScrollEnabled = false
        return cv
    }()
    
    let secondCollectionView : UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.allowsMultipleSelection = false
        cv.isUserInteractionEnabled = true
        cv.backgroundColor = .clear
        cv.isScrollEnabled = false
        return cv
        
    }()
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpNavigationBar()
        setUpViews()
        setUpConstraints()
       
    
        
        
    }
    
    func setUpNavigationBar() {
        
        
        navigationItem.title = "Личные задания"
        let textAttributes = [NSAttributedString.Key.foregroundColor: Colors.textColor, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.layer.cornerRadius = 25
        navigationController?.navigationBar.clipsToBounds = true
        navigationController?.navigationBar.addShadow()
        
        backButton.setImage(UIImage(named: "BackImage"), for: .normal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
       
        
        navigationController?.navigationBar.tintColor = Colors.textColor
        
    }
    
    func setUpCollectionView() {
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 20
        collectionView.addShadow()
        
        
        
        view.addSubview(collectionView)
        
        
        
    }
    
    func setUpSecondCollectionView() {
        
        secondCollectionView.register(SecondCollectionViewFirstCell.self, forCellWithReuseIdentifier: "SecondCollectionViewFirstCell")
        secondCollectionView.register(SecondCollectionViewSecondCell.self, forCellWithReuseIdentifier: "SecondCollectionViewSecondCell")
        secondCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.backgroundColor = .clear
//        secondCollectionView.layer.cornerRadius = 20
//        secondCollectionView.addShadow()
        
        
        
        view.addSubview(secondCollectionView)
        
        
        
    }
    
    
    func setUpViews() {
        
        
        
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = Colors.textColor
        
        
        
        
        backgroundImageView.image = backgroundImage
        view.addSubview(backgroundImageView)
        
        
        setUpCollectionView()
        setUpSecondCollectionView()
        
//        tutorialButton.setTitle("Обучение", for: .normal)
//
//        tasksButton.setTitle("Задания", for: .normal)
        
        
//        [tutorialButton, tasksButton].forEach { (button) in
//            button.titleLabel?.textColor = .yellow
//            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//            button.setTitleColor(Colors.neutralTextColor, for: .normal)
//            button.tintColor = Colors.textColor
//        }
//
//        buttonsStackView.axis = .horizontal
//        buttonsStackView.distribution = .fillEqually
//        buttonsStackView.layer.cornerRadius = 20
//        buttonsStackView.backgroundColor = .white
//        buttonsStackView.addShadow()
//
//        view.addSubview(buttonsStackView)
        
        
        
        
    }

    
   
    
    func setUpConstraints() {
        
        backgroundImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            
        }
        
//        buttonsStackView.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
//            make.left.equalToSuperview()
//            make.right.equalToSuperview()
//            make.height.equalTo(42)
//        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(42)
        }
        
        secondCollectionView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }

}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            return CGSize(width: self.view.frame.width / 2 , height: self.view.frame.height)
        }
        return CGSize(width: self.view.frame.width  , height: self.view.frame.height)
        
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        secondCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell{
            
            cell.select()
            scrollToMenuIndex(menuIndex: indexPath.item)
            
        }
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionView {
            if let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell{
                
                cell.deselect()
                
            }
        }
        if indexPath.item == 0 {
            let cell = collectionView.cellForItem(at: indexPath) as? SecondCollectionViewFirstCell
        }
        else {
            let cell = collectionView.cellForItem(at: indexPath) as? SecondCollectionViewSecondCell
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.collectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
            cell.generateCells(model: buttonsArray[indexPath.item])
            
            if (indexPath.row == 0){
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionView.ScrollPosition.top)
                    cell.select()
                }else{
                    cell.deselect()
                }
                
            return cell
        }
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewFirstCell", for: indexPath) as! SecondCollectionViewFirstCell
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewSecondCell", for: indexPath) as! SecondCollectionViewSecondCell
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
                       shadowOpacity: Float = 0.2,
                       shadowRadius: CGFloat = 2.0) {
            layer.shadowColor = shadowColor
            layer.shadowOffset = shadowOffset
            layer.shadowOpacity = shadowOpacity
            layer.shadowRadius = shadowRadius
            layer.masksToBounds = false
        }
    
    
}

