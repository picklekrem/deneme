//
//  CardsCollectionFlowLayout.swift
//  denemeGit
//
//  Created by Onur Başdaş on 14.05.2021.
//

import UIKit

class CardsCollectionFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        scrollDirection = .horizontal
        itemSize = CGSize(width: collectionView.frame.width / 2.75, height: collectionView.frame.width / 4)
        print(itemSize)
        let peekingItemWidth = itemSize.width / 2
        let horizontalInsets = (collectionView.frame.size.width - itemSize.width) / 2
        
        collectionView.contentInset = UIEdgeInsets(top: 0, left: horizontalInsets, bottom: 0, right: horizontalInsets)
        minimumLineSpacing = horizontalInsets - peekingItemWidth
    }
}


