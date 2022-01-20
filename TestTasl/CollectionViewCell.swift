//
//  CollectionViewCell.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 20.01.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let titleLabel = UILabel()
    
    let dashedView = DashedView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        titleLabel.textColor = Colors.textColor
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(titleLabel)
        dashedView.alpha = 1
        
        contentView.addSubview(dashedView)
      
        
    }
    
   
    
    func setUpConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView)
        }
        
        dashedView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
        }
        
        
        
    }
    
    func generateCells(model : ButtonsModel) {
        
        titleLabel.text = model.titleText
        
        
    }
    
    
}
