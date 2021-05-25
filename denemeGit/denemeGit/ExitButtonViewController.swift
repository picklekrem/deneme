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
        print(one.frame.minX)
    }
        
    @objc func didTapImageView(_ sender: UITapGestureRecognizer) {
        if touch {
            UIView.animate(withDuration: 1) { [self] in
                print("geri geliyorum.")
                one.transform = CGAffineTransform(translationX: 0, y: 0)
                print(one.frame.minX)
                two.transform = CGAffineTransform(translationX: 0, y: 0)
                three.transform = CGAffineTransform(translationX: 0, y: 0)
                four.transform = CGAffineTransform(translationX: 0, y: 0)
                touch = false
            }
        } else {
            UIView.animate(withDuration: 1) { [self] in
                print("kayboluyorum")
                one.transform = CGAffineTransform(translationX: -200, y: -200)
                two.transform = CGAffineTransform(translationX: -200 , y: 200)
                three.transform = CGAffineTransform(translationX: 200, y: 200)
                four.transform = CGAffineTransform(translationX: 200, y: -200)
                touch = true
            }
        }
      
    }
}
