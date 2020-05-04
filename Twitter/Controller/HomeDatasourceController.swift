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
    
    //셀과 셀 사이의 간격을 없애기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
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
        
        //Dynamic cell sizing
        if let user = self.datasource?.item(indexPath) as? User {
            
            //유저셀에서 정의된 바이오 텍스트 왼쪽의 width크기
            let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 8 //width를 줄이면 height가 올라가는 방식
            
            let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
            
            let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            
            //get an estimation of the height of the cell based on the bio.text
            let estimatiedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatiedFrame.height + 80 )

        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
}
