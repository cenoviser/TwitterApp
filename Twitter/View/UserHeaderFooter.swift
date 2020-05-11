//
//  Cells.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/04/25.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

//헤더추가하기
class UserHeader: DatasourceCell {
    
//    override var datasourceItem: Any?{
//        didSet {
//            headerLabel.text = datasourceItem as? String
//        }
//    }
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        //셀을 구분짓는 라인 추가하기
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
//        backgroundColor = .blue
        addSubview(headerLabel)
        headerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
    
}

//푸터추가하기
class UserFooter: DatasourceCell {
    
//    override var datasourceItem: Any?{
//        didSet {
//            footerLabel.text = datasourceItem as? String
//        }
//    }
    
    let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = twitterBlue
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
//        backgroundColor = .white
//        backgroundColor = .systemPink
        
        //두번째 섹션과 첫번째 색션을 구분하기 위한 코드.
        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white
        
        //두번째 섹션과 첫번째 색션을 구분하기 위한 코드.
        addSubview(whiteBackgroundView)
        addSubview(footerLabel)
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        footerLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    
}


