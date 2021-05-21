//
//  ViewController.swift
//  denemeGit
//
//  Created by Ekrem Özkaraca on 12.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var backView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.collectionViewLayout = CardsCollectionFlowLayout()
        backView.isHidden = true
        backView.backgroundColor = .purple
        backView.frame = CGRect(x: 0, y: 0, width: collectionView.frame.width / 1000, height: collectionView.frame.width / 1000)
       
    }
    
    func trustAnimate() {
        UIView.animate(withDuration: 2, animations: {
            let height = self.collectionView.frame.height / 1000
            let width = self.collectionView.frame.width / 1000
            
            self.view.transform = CGAffineTransform.identity.scaledBy(x: width, y: height)
            
        }, completion: { _ in
            //            UIView.animate(withDuration: 2, animations: {
            //                var transform = CATransform3DIdentity
            //                transform.m34 = -0.002
            //                let animation = CABasicAnimation(keyPath: "transform")
            //                animation.fromValue = CATransform3DRotate(transform, 0, 0, 1, 0)
            //                animation.toValue = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, 1, 0)
            //                animation.duration = 2
            //                self.collectionView.setAnchorPoint(CGPoint(x: 0, y: 0))
            //                CATransaction.begin()
            //                self.collectionView.layer.add(animation, forKey: "transform")
            //                CATransaction.setCompletionBlock { [weak self] in
            //                        guard let self = self else {
            //                            return
            //                        }
            //                        self.collectionView.layer.transform = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, 1, 0)
            //                        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
            //                }
            //                CATransaction.commit()
            //            })
            self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        })
    }
    
    func lastUpdate() {
        UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [.calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                self.backView.isHidden = false
                self.backView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.backView.transform.a = 3.1
                self.backView.transform.d = 2.2
            })
        }, completion:{ _ in
            print("I'm done!")
            self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        })
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
        //self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        //trustAnimate()
        lastUpdate()
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

