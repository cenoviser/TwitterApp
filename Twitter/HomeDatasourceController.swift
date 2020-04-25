//
//  HomeDatasourceController.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/04/25.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import LBTAComponents

//이제 이걸 쓰기위해 scene delegate에 가서, 루트뷰에 추가해주기
class HomeDatasourceController: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .red
    }
}
