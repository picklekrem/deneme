//
//  ExitButtonViewController.swift
//  denemeGit
//
//  Created by Onur Başdaş on 22.05.2021.
//

import UIKit
import Foundation

class ExitButtonViewController: UIViewController {
    
    @IBOutlet var backView: UIView!
    @IBOutlet var one: UIButton!
    @IBOutlet var two: UIButton!
    @IBOutlet var three: UIButton!
    @IBOutlet var four: UIButton!
    
    var touch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImageView(_:)))
        backView.isUserInteractionEnabled = true
        backView.addGestureRecognizer(tapGestureRecognizer)
    }
        
    @objc func didTapImageView(_ sender: UITapGestureRecognizer) {
        if touch {
            UIView.animate(withDuration: 1) { [self] in
                one.transform = CGAffineTransform(translationX: -100, y: -100)
                two.transform = CGAffineTransform(translationX: -100, y: 100)
                three.transform = CGAffineTransform(translationX: 100, y: 100)
                four.transform = CGAffineTransform(translationX: 100, y: -100)
                touch = false
            }
        } else {
            one.transform = CGAffineTransform(translationX: 60, y: 37)
            touch = true
        }
      
    }
}
