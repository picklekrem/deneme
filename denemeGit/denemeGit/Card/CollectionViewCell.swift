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
    
    @IBOutlet var alphaTestView: UIView!
    @IBOutlet var backCellView: UIView!
    @IBOutlet var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backCellView.layer.cornerRadius = 16
        cellImageView.layer.cornerRadius = 16
    }
    
    func transformToLarge() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 1.5, y: 1.6)
        }
    }
    
    func transformToStandard() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
        }
    }
}

extension CollectionViewCell: ViewScaleable {
    var scaleView: UIView {
        return backCellView
    }
}


