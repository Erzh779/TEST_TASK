//
//  ShadowClass.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 19.01.2022.


import UIKit

class CustomeTabView: UIView {
    
    var vRadius = UIView()


//    class func instanceFromNib() -> CustomeTabView {
//        return UINib(nibName: "CustomeTabView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! CustomeTabView
//    }

    private var shadowLayer: CAShapeLayer!

    override func layoutSubviews() {
        super.layoutSubviews()

        let shadowSize : CGFloat = 2.0

        let shadowPath = UIBezierPath(roundedRect: CGRect(x: -shadowSize / 2,   y: -shadowSize / 2, width: self.vRadius.frame.size.width, height: self.vRadius.frame.size.height), cornerRadius : 20)

        self.vRadius.layer.masksToBounds = false
        self.vRadius.layer.shadowColor = UIColor.black.cgColor
        self.vRadius.layer.shadowOffset = CGSize.zero//(width: self.vRadius.frame.size.width, height: self.vRadius.frame.size.height)
        self.vRadius.layer.shadowOpacity = 0.5
        self.vRadius.layer.shadowPath = shadowPath.cgPath
        self.vRadius.layer.cornerRadius = 20
      }
}
