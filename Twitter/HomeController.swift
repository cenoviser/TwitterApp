//
//  HomeController.swift
//  Twitter
//
//  Created by Jiwoo Ban on 2020/04/25.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import UIKit

//our own custom cell
class WordCell: UICollectionViewCell {
    
    //this gets called when a cell is dequeued
    //셀이 디큐되었을때, 불려진다.
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    let wordLabel: UILabel = {
       let label = UILabel()
        label.text = "Hello Hello Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        backgroundColor = .yellow
        
        //to add label
        addSubview(wordLabel)
        
        //텍스트를 스크린에 어떻게 뿌릴거냐? - 앵커를 사용할거
        wordLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let headerId = "headerId"
    let footerID = "footerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        //디폴트 uicollectionviewcell을 사용하기보단, 새로운 our own custom cell 을 쓰기위해 바꿔준다
        //        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellId)
        
        //헤더추가!
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        //푸터추가!
        collectionView.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
        
    }
    
    //number of items in section!
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    //cell for item at!
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)-> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    //size for item at! cell의 크기 정의!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    //헤더와 푸터를 구현!
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            header.backgroundColor = .black
            return header
        }
        
        else{
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath)
            footer.backgroundColor = .systemPink
            return footer
        }

    }
    
    //reference size for header in section!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    
    //reference size for footer in section! 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 77)
    }
    
    
}
