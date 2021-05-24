//
//  CollectionViewCell.swift
//  denemeGit
//
//  Created by Onur Başdaş on 14.05.2021.
//

import UIKit
import Foundation

protocol ViewScaleable {
    var scaleView: UIView { get }
}

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
    @IBOutlet var backCellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension CollectionViewCell: ViewScaleable {
    var scaleView: UIView {
        return backCellView
    }
}


