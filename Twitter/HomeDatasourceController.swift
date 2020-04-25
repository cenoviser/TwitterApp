//
//  HomeDatasourceController.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/04/25.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents

//github remote repository added.
//Let's start using Branch: jiwoo
//I will edit some code and try to merge jiwoo's branch work into master!
//Let's check this tree on SourceTree


//헤더추가하기
class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .black
    }
}

//푸터추가하기
class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .lightGray
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



//이제 이걸 쓰기위해 scene delegate에 가서, 루트뷰에 추가해주기
class HomeDatasourceController: DatasourceController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이전에 직접 만들었던 셀이랑, 헤더랑 푸터를 다시 만들어 보자. 이번에는 컴포넌트를 이용해서!
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        
    }
    
    
    //header size정의
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    //footer size 정의
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}
