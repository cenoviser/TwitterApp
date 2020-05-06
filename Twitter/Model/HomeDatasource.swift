//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/04/25.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let JiwooUser = User(name: "Jiwoo Ban", username: "@Let's Build That App", bioText: "Hello, my name is Jiwoo Ban, JB. I'm working for a company name Wellers as a software engineer. I'm developiing an iOS application. And I'm 26 years old.", image: UIImage.init(named: "jiwoo")!)
        let anotherUser = User(name: "Next big thing?", username: "@Let's Build That App", bioText: "Hello, I'm Song. My name sounds like a music.", image: .actions)
        let newUser = User(name: "DynamicCell User", username: "Dynamic", bioText: "I'd like to build a great App for the people who wants to develop themselves, and who always want to imrpove, live a better live constantly. I think these kind of person is called 'Goal-Oriented'. Wellers will be the Greated application for the world, it will make people to go forward. Live well. Everybody will be Wellers ", image:.strokedCheckmark)
        
        
        return [JiwooUser, anotherUser, newUser]
    }()
    
    let tweets = ["tweet1", "tweet2"]
    
//    let words = ["user1", "user2", "user3"]
    
    
    //UserHeader에서 정의한 cell 적용시키기
    //이것의 사이즈를 정의하기위해 컨트롤러에 추가하기
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    //Footer cell 정의
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }

//    override func footerItem(_ section: Int) -> Any? {
//        return "This is the footer! words.count = " + "\(words.count)"
//    }
    
//    override func headerItem(_ section: Int) -> Any? {
//        return "This is the Header!"
//    }
    
    //UserCell에서 정의한 Cell을 적용시키기!
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    //인덱스에 있는 아이템을 리턴하여 셀에 보내는것!
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    //셀밑에 섹션 추가하기
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        //두번째 섹션
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
