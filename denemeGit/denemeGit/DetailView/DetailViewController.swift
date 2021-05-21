//
//  DetailViewController.swift
//  denemeGit
//
//  Created by Onur Başdaş on 14.05.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadHomeScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyBoard.instantiateViewController(identifier: "mainTabBarVC_ID")
        mainTabBarController.modalPresentationStyle = .fullScreen
        self.present(mainTabBarController, animated: true, completion: nil)
    }

    @IBAction func backButton(_ sender: Any) {
        loadHomeScreen()
        //dismiss(animated: true, completion: nil)
    }
}



