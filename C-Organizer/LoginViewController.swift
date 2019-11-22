//
//  loginViewController.swift
//  C-Organizer
//
//  Created by Emmanuel Gyekye Atta-Penkra on 11/22/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()

        // Do any additional setup after loading the view.
    }
    
    func setBackground() {
           view.addSubview(backgroundImageView)
           backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
           backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
           backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
           backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

           backgroundImageView.image = UIImage (named: "background4")

           view.sendSubviewToBack(backgroundImageView)
       }
    


}
