//
//  TweetCell.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/05/07.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    //트윗메세지 모델에있는걸 show하기
    override var datasourceItem: Any? {
        didSet {
            //트윗으로 케스팅하는걸 시도!
            guard let tweet = datasourceItem as? Tweet else { return  }
            
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)])
            
            let usernameString = "  \(tweet.user.username)"
            
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            
            //paragraph에 라인스페이징을 추가해서 이름밑으로 트윗텍스트가 어느정도 벌어지게끔하기. 하지만 이 코드를 트윗텍스트 밑에다 추가하면 트윗텍스트 모든게 벌어져서 보임.
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 40
            let range = NSMakeRange(0, attributedText.string.count)
            attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range)
            
            
            //트윗 텍스트 어트리뷰트
            let tweetString = "\n\(tweet.message)"
            attributedText.append(NSAttributedString(string: tweetString, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]))
            
            //만약 케스팅이 성공적이라면,
            messageTextView.attributedText = attributedText //하지만 homedatasource에 있는 item에서, 두번쨰 섹션이면 트윗메세지가 표시되게끔 해줘야함.
        }
    }
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "SOME TEXT"
        tv.backgroundColor = .yellow
        return tv
    }()
    
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
    
    
    let replyButton: UIButton = {
        //시스템으로 하면 can be highlighted
        let button = UIButton(type: .system)
        let replyImage = UIImage(named: "reply")
        button.setImage(replyImage, for: .normal)
        return button
    }()
    
    
    let retweetButton: UIButton = {
        //시스템으로 하면 can be highlighted
        let button = UIButton(type: .system)
        let replyImage = UIImage(named: "retweet")
        button.setImage(replyImage, for: .normal)
        return button
    }()
    
    
    override func setupViews() {
        
        //원래는 라인이 히든되어있음
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
//        addSubview(replyButton)
//        addSubview(retweetButton)
        
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 60)
        
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 7, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
//        replyButton.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        // UIStackView를 사용해서 트윗셀 밑에 리플라이, 리트윗,..., 등 4개의 버튼을 어떤 화면에서든 한번에 관리하기 쉽게 만들기
        setupBottomButtons()
    }
    
    
    fileprivate func setupBottomButtons() {
        let view = UIView()
        view.backgroundColor = .red
        let buttonStackView = UIStackView(arrangedSubviews: [view])
        
        addSubview(buttonStackView)
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
    }
    
    
    
}
