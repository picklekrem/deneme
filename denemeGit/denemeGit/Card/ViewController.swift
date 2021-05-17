//
//  ViewController.swift
//  denemeGit
//
//  Created by Ekrem Özkaraca on 12.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.collectionViewLayout = CardsCollectionFlowLayout()
        view.backgroundColor = .black
    }
    
    
    func trustAnimate() {
        UIView.animate(withDuration: 2, animations: {
            self.collectionView.transform = CGAffineTransform.identity.scaledBy(x: 3.2, y: 3.2)
            //self.collectionView?.transform = CGAffineTransform(scaleX: self.view.frame.width, y: self.view.frame.height)
        }, completion: { _ in
            UIView.animate(withDuration: 2, animations: {
                var transform = CATransform3DIdentity
                transform.m34 = 0.002
                let animation = CABasicAnimation(keyPath: "transform")
                animation.fromValue = CATransform3DRotate(transform, 0, 0, 1, 0)
                animation.toValue = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, 1, 0)
                animation.duration = 2
                self.collectionView.setAnchorPoint(CGPoint(x: 0, y: 0))
                CATransaction.begin()
                self.collectionView.layer.add(animation, forKey: "transform")
                CATransaction.setCompletionBlock { [weak self] in
                        guard let self = self else {
                            return
                        }
                        self.collectionView.layer.transform = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, 1, 0)
                        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
                }
                CATransaction.commit()
            })
        })
    }
    
    func lastUpdate() {
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [.calculationModeCubic], animations: {
            // Add animations
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/5.0, animations: {
                self.collectionView.frame.origin.x += 200
            })
            UIView.addKeyframe(withRelativeStartTime: 1.0/5.0, relativeDuration: 1.0/5.0, animations: {
                self.collectionView.backgroundColor = .green
            })
            UIView.addKeyframe(withRelativeStartTime: 2.0/5.0, relativeDuration: 1.0/5.0, animations: {
                self.collectionView.frame.origin.y += 200
            })
            UIView.addKeyframe(withRelativeStartTime: 3.0/5.0, relativeDuration: 1.0/5.0, animations: {
                self.collectionView.transform = CGAffineTransform.identity.scaledBy(x: 2, y: 2)
            })
            UIView.addKeyframe(withRelativeStartTime: 4.0/5.0, relativeDuration: 1.0/5.0, animations: {
                self.collectionView.alpha = 0
            })
        }, completion:{ _ in
            print("I'm done!")
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
        trustAnimate()
        //lastUpdate()
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
