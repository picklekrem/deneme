//
//  ViewController.swift
//  denemeGit
//
//  Created by Ekrem Özkaraca on 12.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var firstView: UIView!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var secondView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.collectionViewLayout = CardsCollectionFlowLayout()
        firstView.isHidden = true
        secondView.isHidden = true
    }
    
    func test() {
        UIView.animate(withDuration: 2, animations: {
            self.firstView.isHidden = false
            var transform = CATransform3DIdentity
            transform.m34 = -0.002
            let animation = CABasicAnimation(keyPath: "transform")
            animation.fromValue = CATransform3DRotate(transform, 0, 0, 1, 0)
            animation.toValue = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, -1, 0)
            animation.duration = 2
            self.firstView.setAnchorPoint(CGPoint(x: 0, y: 0.5))
            CATransaction.begin()
            self.firstView.layer.add(animation, forKey: "transform")
            self.firstView.layer.transform = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, -1, 0)
            
        }) { (completed) in
            UIView.animate(withDuration: 2, delay: 0, options: [], animations: { [self] in
                secondView.isHidden = false
                secondView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                secondView.transform.a = 3.1
                secondView.transform.d = 2.05
            }) { _ in
                self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
            }
        }
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
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [.calculationModeCubic], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                self.firstView.isHidden = false
                var transform = CATransform3DIdentity;
                transform.m34 = -0.002;
                transform = CATransform3DRotate(transform, CGFloat(90 * M_PI / 180), 0, -1, 0)
                self.firstView.layer.transform = transform
                self.firstView.setAnchorPoint(CGPoint(x: 0, y: 0.5))
                
                //                self.backView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                //                self.backView.transform.a = 3.1
                //                self.backView.transform.d = 2.05
            })
            UIView.addKeyframe(withRelativeStartTime: 19.0/20.0, relativeDuration: 3.0, animations: {
                self.secondView.isHidden = false
                self.secondView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.secondView.transform.a = 3.1
                self.secondView.transform.d = 2.05
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
        //trustAnimate()
        //lastUpdate()
        test()
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

