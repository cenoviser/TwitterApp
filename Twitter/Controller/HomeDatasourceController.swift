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
        
        //셀을 받치고있는 컨트롤러에 라이트블루 색깔 입히기
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        //커스텀 네비게이션바
        setupNavigationBarItems()
        
        
        //이전에 직접 만들었던 셀이랑, 헤더랑 푸터를 다시 만들어 보자. 이번에는 컴포넌트를 이용해서!
        let homeDatasource = HomeDatasource()
        self.datasource = homeDatasource
        
    }
    
    
    
    //네이케이션바 커스터마이징
    private func setupNavigationBarItems() {

        
        //타이틀 + remaining
        let title_icon = UIImageView()
        title_icon.image = UIImage(named: "title_icon")
        navigationItem.titleView = title_icon
        title_icon.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        title_icon.contentMode = .scaleAspectFit
        
            //네비게이션바에 선이 보이는것을 없애기
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            //네이케이션바의 선을 안보이게 한후, 아주 얇은 라인추가하기
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        
        //왼쪽
        let followButton = UIButton(type: .system)
        let followButtonImage = UIImage(named: "follow")
        followButton.setImage(followButtonImage?.withRenderingMode(.alwaysOriginal), for: .normal) //버튼이미지의 색깔이 다르게 보여서, 렌더링모드의 항상 원본유지 하는 코드 추가.
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
        followButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        
        
        //오른쪽 두개의 버튼
        let searchButton = UIButton(type: .system)
        let searchButtonImage = UIImage(named: "search")
        let composeButton = UIButton(type: .system)
        let composeButtonImage = UIImage(named: "compose")
        
        searchButton.setImage(searchButtonImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        composeButton.setImage(composeButtonImage?.withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
        
        
        //네이게이션바를 하얗게
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    
    
    
    
    //셀과 셀 사이의 간격을 없애기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    //header size정의
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        //첫번째 섹션은 0부터 시작. 다음 섹션부터는 헤더와 푸터를 적용시키기 않기 위한 코드
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    //footer size 정의
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
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
