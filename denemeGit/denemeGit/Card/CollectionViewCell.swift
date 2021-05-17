//
//  CollectionViewCell.swift
//  denemeGit
//
//  Created by Onur Başdaş on 14.05.2021.
//

import UIKit
import Foundation

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    @IBOutlet var backView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}


