//
//  TweetCell.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/05/07.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    
    
    //UserCell의 왼쪽에 이미지 뷰를 넣을 공간 만들기
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jiwoo_png")
        //모서리 둥글하게
        imageView.layer.cornerRadius = 5
//        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor(r: 170, g: 170, b: 170).cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()
    
    
    override func setupViews() {
        
        //원래는 라인이 히든되어있음
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
    }
}
