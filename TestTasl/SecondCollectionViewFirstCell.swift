//
//  SecondCollectionViewFirstCell.swift
//  TestTasl
//
//  Created by Erzhan Taipov on 21.01.2022.
//

import UIKit

class SecondCollectionViewFirstCell: UICollectionViewCell {
    
    let tableView = UITableView()
  
    let smallCardArray = [SmallCardModel(cardText: "Основные правила сортировки отходов", cardNumber: "3"),
                          SmallCardModel(cardText: "Обучение 1", cardNumber: "5")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
        
    }
    
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        
        contentView.backgroundColor = .clear
        setUpTableView()
        
        
    }
    
    func select() {

    }
    
    func deselect() {
       
        
    }
    
    
    func setUpConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(60)
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.bottom.equalTo(contentView)
        }
        
        
    }
    
    func generateCells(model : ButtonsModel) {
        
       
        
        
    }
    func setUpTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "FirstTableViewCell")
        tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: "SecondTableViewCell")

        tableView.isScrollEnabled = true
        
        tableView.tableHeaderView = nil
        tableView.tableFooterView = nil
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        contentView.addSubview(tableView)
        
        
        
    }
    
}
extension SecondCollectionViewFirstCell : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
//        case 1:
//            return 2
        default:
            return smallCardArray.count
        }
   
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 320
        default:
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }
        else {
            return 30
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: 30))
        header.backgroundColor = .clear
        let headerLabel = UILabel()
        let dottedLine = DashedView()
        headerLabel.font = UIFont.boldSystemFont(ofSize: 16)
        headerLabel.textColor = Colors.neutralTextColor
        headerLabel.textAlignment = .left
        
        
        if section == 0 {
            headerLabel.text = ""
            header.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
            header.clipsToBounds = true
            
        }
        else{
            headerLabel.text = "Активные"
        }

        header.addSubview(headerLabel)
        header.addSubview(dottedLine)
       
        headerLabel.snp.makeConstraints { make in
            make.left.equalTo(header).inset(20)
            make.centerY.equalTo(header)
        }
        
        dottedLine.snp.makeConstraints { make in
            make.bottom.equalTo(header.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(header).inset(23)
            make.right.equalTo(header).inset(23)
        }
//
//        headerLabel.centerYAnchor.constraint(equalTo: header.centerYAnchor).isActive = true

        return header
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTableViewCell", for: indexPath) as! FirstTableViewCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            
            return cell
        
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.generateCells(model: smallCardArray[indexPath.item])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTableViewCell", for: indexPath) as! SecondTableViewCell
            cell.backgroundColor = .clear
            return cell
        }
    }
    
   
    
    
    
    
}
