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
        backgroundColor = .blue
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
        backgroundColor = .systemPink
        
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
    
    //UserCell의 왼쪽에 이미지 뷰를 넣을 공간 만들기
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
//        label.text = "T T T"
        label.backgroundColor = .green
        return label
    }()
    
    let usernameLable: UILabel = {
        let label = UILabel()
        label.text = "User name"
        label.backgroundColor = .purple
        return label
    }()
    
    //bio는 Text View로
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Your bio"
        textView.backgroundColor = .yellow
        return textView
    }()
    
    
    //How to put the String into the Button?
    let followButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .cyan
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
//        backgroundColor = .yellow
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLable)
        addSubview(bioTextView)
        addSubview(followButton)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        //left anchor은 프로파일 이미지의 오른쪽!
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        //right anchor은 위의 nameLabel과 같게 하기 위해
        usernameLable.anchor(nameLabel.bottomAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 4, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLable.bottomAnchor, left: usernameLable.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
    }
}

