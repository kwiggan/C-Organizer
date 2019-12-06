//
//  myClassViewController.swift
//  C-Organizer
//
//  Created by Administrator on 11/18/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class MyClassViewController: UIViewController {
    
        let backgroundImageView = UIImageView()

    @IBOutlet weak var longestNameButton: UIButton!
    @IBOutlet weak var averageButton: UIButton!
    @IBOutlet weak var TotalCharacterButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setBackground() 
        // Do any additional setup after loading the view.
        longestNameButton.layer.cornerRadius = longestNameButton.frame.height / 6
         averageButton.layer.cornerRadius = averageButton.frame.height / 6
         TotalCharacterButton.layer.cornerRadius = TotalCharacterButton.frame.height / 6
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let all = segue.destination as! AllNamesViewController
        all.segue = segue.identifier!
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
