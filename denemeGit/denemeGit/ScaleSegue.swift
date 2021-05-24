//
//  ScaleSegue.swift
//  denemeGit
//
//  Created by Onur Başdaş on 17.05.2021.
//

import UIKit

class ScaleSegue: UIStoryboardSegue {
    override func perform() {
        destination.transitioningDelegate = self
        super.perform()
    }
}

extension ScaleSegue : UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScalePresentAnimator()
    }
}

class ScalePresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        var fromViewController = transitionContext.viewController(forKey: .from)
        let fromView = transitionContext.view(forKey: .from)
        
        let toViewController = transitionContext.viewController(forKey: .to)!
        let toView = transitionContext.view(forKey: .to)
        
        if let toView = toView {
            transitionContext.containerView.addSubview(toView)
        }
        
        var startFrame = CGRect(x: (toView?.frame.maxX)!, y: ((toView?.frame.maxY)! / 2), width: 0, height: 0)
        if let fromViewController = fromViewController as? ViewScaleable {
            startFrame = fromViewController.scaleView.frame
        } else {
            print("WARNING!!")
        }
        
        toView?.frame = startFrame
        toView?.layoutIfNeeded()
        
        let duration = transitionDuration(using: transitionContext)
        let finalFrame = transitionContext.finalFrame(for: toViewController)
        
        UIView.animate(withDuration: duration) {
            toView?.frame = finalFrame
            toView?.layoutIfNeeded()
        } completion: { finished in
            transitionContext.completeTransition(true)
        }

    }
    
}
