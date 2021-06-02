//
//  AlertView.swift
//  denemeGit
//
//  Created by Onur Başdaş on 2.06.2021.
//

import UIKit

protocol AlertViewDelegate: class {
    func yesClicked()
    func noClicked()
}

class AlertView: UIView {

    @IBOutlet var backViewAlert: UIView!
    @IBOutlet var yesButton: UIButton!
    @IBOutlet var noButton: UIButton!
    @IBOutlet var bgMaskView: UIView!
    
    weak var delegate : AlertViewDelegate?
    
    override func awakeFromNib() {
        backViewAlert.layer.cornerRadius = 10
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closePopUp))
        self.bgMaskView.isUserInteractionEnabled = true
        self.bgMaskView.addGestureRecognizer(tapGesture)
    }
    
    @objc func closePopUp() {
        self.delegate?.noClicked()
    }
    
    @IBAction func yesButtonClicked(_ sender: Any) {
        self.delegate?.yesClicked()
    }
    
    
    @IBAction func noButtonClicked(_ sender: Any) {
        self.delegate?.noClicked()
    }
    
    
    
}
