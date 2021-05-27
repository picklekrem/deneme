////
////  Important.swift
////  denemeGit
////
////  Created by Onur Başdaş on 27.05.2021.
////
//
//import Foundation
//
//func test() {
//
//    //scroll position
//    self.firstPopUp.isHidden = false
//    var transform = CATransform3DIdentity
//    transform.m34 = -0.002
//    let animation = CABasicAnimation(keyPath: "transform")
//    animation.fromValue = CATransform3DRotate(transform, 0, 0, 1, 0)
//    animation.toValue = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, -1, 0)
//    animation.duration = 2
//    self.firstPopUp.setAnchorPoint(CGPoint(x: 0, y: 0.5))
//    CATransaction.begin()
//    self.firstPopUp.layer.add(animation, forKey: "transform")
//    self.firstPopUp.layer.transform = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, -1, 0)
//    UIView.animate(withDuration: 1, delay: 2, animations: { [self] in
//        secondView.isHidden = false
//        secondView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//        secondView.transform.a = 3.1
//        secondView.transform.d = 2.05
//    }) {_ in
//        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
//    }
//
//
//}
//func trustAnimate() {
//    UIView.animate(withDuration: 2, animations: {
//        let height = self.collectionView.bounds.height
//        let width = self.collectionView.bounds.width
//
//        self.view.transform = CGAffineTransform.identity.scaledBy(x: 2.75, y: 4)
//
//    }, completion: { _ in
//        //            UIView.animate(withDuration: 2, animations: {
//        //                var transform = CATransform3DIdentity
//        //                transform.m34 = -0.002
//        //                let animation = CABasicAnimation(keyPath: "transform")
//        //                animation.fromValue = CATransform3DRotate(transform, 0, 0, 1, 0)
//        //                animation.toValue = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, 1, 0)
//        //                animation.duration = 2
//        //                self.collectionView.setAnchorPoint(CGPoint(x: 0, y: 0))
//        //                CATransaction.begin()
//        //                self.collectionView.layer.add(animation, forKey: "transform")
//        //                CATransaction.setCompletionBlock { [weak self] in
//        //                        guard let self = self else {
//        //                            return
//        //                        }
//        //                        self.collectionView.layer.transform = CATransform3DRotate(transform, CGFloat(90 * Double.pi / 180.0), 0, 1, 0)
//        //                        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
//        //                }
//        //                CATransaction.commit()
//        //            })
//        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
//    })
//}
//
//func lastUpdate() {
//    UIView.animateKeyframes(withDuration: 2.0, delay: 0, options: [.calculationModeCubic], animations: {
//        UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
//            self.firstView.isHidden = false
//            var transform = CATransform3DIdentity;
//            transform.m34 = -0.002;
//            transform = CATransform3DRotate(transform, CGFloat(90 * M_PI / 180), 0, -1, 0)
//            self.firstView.layer.transform = transform
//            self.firstView.setAnchorPoint(CGPoint(x: 5, y: 0.5))
//
//            //                self.backView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            //                self.backView.transform.a = 3.1
//            //                self.backView.transform.d = 2.05
//        })
//        UIView.addKeyframe(withRelativeStartTime: 19.0/20.0, relativeDuration: 3.0, animations: {
//            self.secondView.isHidden = false
//            self.secondView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
//            self.secondView.transform.a = 3.1
//            self.secondView.transform.d = 2.05
//        })
//    }, completion:{ _ in
//        print("I'm done!")
//        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
//    })
//}
