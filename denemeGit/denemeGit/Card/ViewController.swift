//
//  ViewController.swift
//  denemeGit
//
//  Created by Ekrem Özkaraca on 12.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var firstPopUp: XibView!
    @IBOutlet var secondPopUp: XibView!
    
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.collectionViewLayout = CardsCollectionFlowLayout()
     
        firstPopUp.isHidden = true
        secondPopUp.isHidden = true
        
    }
    
    func deneme() {
        //scroll position
     
        UIView.animate(withDuration: 1, animations: { [self] in
            firstPopUp.isHidden = false
            if let customPopUpView = self.firstPopUp.contentView as? FirstView {
                customPopUpView.awakeFromNib()
                customPopUpView.firstImage.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }
//            imageView.transform.a = 3.1
//            imageView.transform.d = 2.05
        }) { [self]_ in

            var transform = CATransform3DIdentity
            transform.m34 = -0.0005
            let animation = CABasicAnimation(keyPath: "transform")
            animation.fromValue = CATransform3DRotate(transform, 0, 0, 1, 0)
            animation.toValue = CATransform3DRotate(transform, CGFloat(120 * Double.pi / 180.0), 0, -1, 0)
            animation.duration = 2
            self.firstPopUp.setAnchorPoint(CGPoint(x: 0, y: 0.5))
            CATransaction.begin()
            self.firstPopUp.layer.add(animation, forKey: "transform")
            self.secondPopUp.isHidden = false
            self.firstPopUp.layer.transform = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, 1, 0)
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector:#selector(segueing),userInfo: nil, repeats: false)
        }
    }
    
    @objc func segueing() {
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        //        trustAnimate()
        //        lastUpdate()

        //        test()

        deneme()
    }
}

extension UIView{
    func setAnchorPoint(_ point: CGPoint) {
        var newPoint = CGPoint(x: bounds.size.width * point.x, y: bounds.size.height * point.y)
        var oldPoint = CGPoint(x: bounds.size.width * layer.anchorPoint.x, y: bounds.size.height * layer.anchorPoint.y);
        
        newPoint = newPoint.applying(transform)
        oldPoint = oldPoint.applying(transform)
        
        var position = layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x
        
        position.y -= oldPoint.y
        position.y += newPoint.y
        
        layer.position = position
        layer.anchorPoint = point
    }
}

