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
    
    //Cell size 정의
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
}
