//
//  UserCell.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/05/01.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents

//cell에 색깔을 넣어봅시다.
class UserCell: DatasourceCell {
    
    //정의한 word들을 레이블에 넣기
    override var datasourceItem: Any? {
        didSet {
//            nameLabel.text = datasourceItem as? String
            guard let user = datasourceItem as? User else {
                return
            }
            nameLabel.text = user.name
            usernameLable.text = user.username
            bioTextView.text = user.bioText
            profileImageView.image = user.image
        }
    }
    
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
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jiwoo Ban"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let usernameLable: UILabel = {
        let label = UILabel()
        label.text = "@Wellers"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        return label
    }()
    
    //bio는 Text View로
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Your bioYour bioYour bioYour bioYour bioYour bioYour bioYour bioYour bioYour bioYour bioYour bioYour bioYour bioYour bio"
//        textView.backgroundColor = .yellow
        textView.font = UIFont.systemFont(ofSize: 15)
        //유저네임레이블이 좀 짤려보이는거 수정하기
        textView.backgroundColor = .clear
//        textView.backgroundColor = .red
        return textView
    }()
    
    
    
    let followButton: UIButton = {
        let button = UIButton()
        let twitterBlue = UIColor(r: 61, g: 167, b: 244)
//        button.backgroundColor = .cyan
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 2
        
        //Put the String into the Button?
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(twitterBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setImage(.checkmark, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
//        button.titleEdgeInsets = UIEdgeInsets(top: <#T##CGFloat#>, left: <#T##CGFloat#>, bottom: <#T##CGFloat#>, right: <#T##CGFloat#>)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        //cell과 cell사이에 간격이 있다. 
//        backgroundColor = .yellow
        
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLable)
        addSubview(bioTextView)
        addSubview(followButton)
        
        //셀을 분리하는 라인 추가하기
        separatorLineView.isHidden = false
        //        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        //left anchor은 프로파일 이미지의 오른쪽!
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        //right anchor은 위의 nameLabel과 같게 하기 위해
        usernameLable.anchor(nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 4, leftConstant: 5, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLable.bottomAnchor, left: usernameLable.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
    }
}

