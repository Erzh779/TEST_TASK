//
//  SecondTableViewCell.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 21.01.2022.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    let cardView = UIView()
    let cardNumberView = UIView()
    let cardLabel = UILabel()
    let cardNumberLabel = UILabel()
    let cardImageView = UIImageView()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style : style, reuseIdentifier : reuseIdentifier)
        
       
        setUpViews()
        setUpConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 20
        cardView.addShadow()
        contentView.addSubview(cardView)
        
//        contentView.backgroundColor = .yellow
        cardLabel.textColor = Colors.darkTextColor
        cardLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cardLabel.numberOfLines = 0
        cardView.addSubview(cardLabel)
        
        cardNumberView.backgroundColor = .white
        cardNumberView.layer.cornerRadius = 20
        cardNumberView.addShadow()
        cardView.addSubview(cardNumberView)
        
        cardNumberLabel.textColor = Colors.textColor
        cardNumberLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cardNumberView.addSubview(cardNumberLabel)
    
        cardImageView.image = UIImage(named: "CardNotImage")
        cardNumberView.addSubview(cardImageView)
    }
    
    func setUpConstraints() {
        
        cardView.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(17.5)
            make.right.equalTo(contentView).inset(17.5)
            make.height.equalTo(45)
            make.top.equalTo(contentView).inset(8)
            make.bottom.equalTo(contentView).inset(8)
            
        }
        
        cardLabel.snp.makeConstraints { make in
            make.left.equalTo(cardView).inset(9.5)
            make.centerY.equalTo(cardView)
//            make.top.equalTo(cardView).inset(12)
//            make.bottom.equalTo(cardView).inset(12)
            make.width.equalTo(200)
            
        }
        
        cardNumberView.snp.makeConstraints { make in
            make.right.equalTo(cardView).inset(9.5)
            make.centerY.equalTo(cardView)
            make.width.equalTo(50)
            make.height.equalTo(24)
            
        }
        
        cardNumberLabel.snp.makeConstraints { make in
            make.left.equalTo(cardNumberView).inset(10)
            make.centerY.equalTo(cardNumberView)
            
        }
        
        cardImageView.snp.makeConstraints { make in
            make.right.equalTo(cardNumberView)
            make.top.equalTo(cardNumberView)
            make.bottom.equalTo(cardNumberView)
            make.width.equalTo(24)
        }
        
    }
    
    func generateCells(model: SmallCardModel) {
        
        cardLabel.text = model.cardText
        cardNumberLabel.text = model.cardNumber
        
    }
}
