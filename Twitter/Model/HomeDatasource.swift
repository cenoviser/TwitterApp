//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/04/25.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    let words = ["user1", "user2", "user3", "1111", "222"]
    
    
    //UserHeader에서 정의한 cell 적용시키기
    //이것의 사이즈를 정의하기위해 컨트롤러에 추가하기
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    //Footer cell 정의
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    //UserCell에서 정의한 Cell을 적용시키기!
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    //인덱스에 있는 아이템을 리턴하여 셀에 보내는것!
    override func item(_ indexPath: IndexPath) -> Any? {
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
