//
//  DetailViewController.swift
//  denemeGit
//
//  Created by Onur Başdaş on 14.05.2021.
//

import UIKit

class DetailViewController: UIViewController, AlertViewDelegate {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var homeButton: UIButton!
    @IBOutlet var alertView: XibView!
    
    var touchButton = true
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        homeButton.transform = CGAffineTransform(translationX: 0, y: -200)
        timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector:#selector(segueing),userInfo: nil, repeats: false)
        
        
        
        alertView.isHidden = true
        
    }
    
    func yesClicked() {
        loadHomeScreen()
    }
    
    func noClicked() {
        alertView.isHidden = true
    }
    
    
    @objc func segueing() {
        UIView.animate(withDuration: 0.5) { [self] in
            homeButton.transform = CGAffineTransform(translationX: 0, y: 0)
            touchButton = false
        }
    }
    
    @objc func didTapImageView(_ sender: UITapGestureRecognizer) {
        if touchButton {
            UIView.animate(withDuration: 1) { [self] in
                homeButton.transform = CGAffineTransform(translationX: 0, y: 0)
                touchButton = false
            }
        } else {
            UIView.animate(withDuration: 1) { [self] in
                homeButton.transform = CGAffineTransform(translationX: 0, y: -200)
                touchButton = true
            }
        }
    }
    
    func animateFunc() {
        if let customPopUpView = self.alertView.contentView as? AlertView {
            customPopUpView.delegate = self
            customPopUpView.awakeFromNib()
            AlertView.animate(withDuration: 0, animations: {() -> Void in
                customPopUpView.backViewAlert?.transform = CGAffineTransform(scaleX: 0, y: 0)
            }, completion: {(_ finished: Bool) -> Void in
                AlertView.animate(withDuration: 1, animations: {() -> Void in
                    customPopUpView.backViewAlert?.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            })
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        alertView.isHidden = false
        animateFunc()
    }
    
    func loadHomeScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyBoard.instantiateViewController(identifier: "mainTabBarVC_ID")
        mainTabBarController.modalPresentationStyle = .fullScreen
        mainTabBarController.modalTransitionStyle = .crossDissolve
        self.present(mainTabBarController, animated: true, completion: nil)
    }
    
}



