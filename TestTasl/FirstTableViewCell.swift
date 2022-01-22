//
//  FirstTableViewCell.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 21.01.2022.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    let cardView = UIView()
    let cardImageView = UIImageView()
    let cardLabel = UILabel()
    
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
        
        contentView.backgroundColor = .clear
        cardView.backgroundColor = .white
        cardView.layer.cornerRadius = 20
        cardView.addShadow()
        contentView.addSubview(cardView)
        
        cardImageView.image = UIImage(named: "CardImage")
        
        cardView.addSubview(cardImageView)
        
        cardLabel.text = "Обучение - это ваше личное руководство, как начать жить в гармонии с природой."
        cardLabel.textAlignment = .center
        cardLabel.numberOfLines = 0
        cardLabel.textColor = Colors.cardTextColor
        cardLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cardView.addSubview(cardLabel)
        
        
        
        
    }
    
    func setUpConstraints() {

        cardView.snp.makeConstraints { make in
//            make.top.equalTo(contentView.safeAreaLayoutGuide).inset(40)
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).inset(17.5)
            make.right.equalTo(contentView).inset(17.5)
            make.height.equalTo(280)
        }
        
        cardImageView.snp.makeConstraints { make in
            make.top.equalTo(cardView).inset(20)
            make.left.equalTo(cardView).inset(28)
            make.right.equalTo(cardView).inset(28)
            make.height.equalTo(160)
        }
       
        cardLabel.snp.makeConstraints { make in
            make.top.equalTo(cardImageView.snp.bottom).offset(16)
            make.bottom.equalTo(cardView).inset(20)
            make.left.equalTo(cardView).inset(26)
            make.right.equalTo(cardView).inset(26)
            
        }
        
    }
    
    func generateCells(model: ButtonsModel) {
        

        
        
        
        
    }



}
