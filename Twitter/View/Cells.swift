//
//  Cells.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/04/25.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents


//헤더추가하기
class UserHeader: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet {
            headerLabel.text = datasourceItem as? String
        }
    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        addSubview(headerLabel)
        headerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}

//푸터추가하기
class UserFooter: DatasourceCell {
    
    override var datasourceItem: Any?{
        didSet {
            footerLabel.text = datasourceItem as? String
        }
    }
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .lightGray
        
        addSubview(footerLabel)
        footerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    
}


//cell에 색깔을 넣어봅시다.
class UserCell: DatasourceCell {
    
    //정의한 word들을 레이블에 넣기
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "T T T"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .yellow
        
        addSubview(nameLabel)
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}

