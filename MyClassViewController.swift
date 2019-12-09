//
//  myClassViewController.swift
//  C-Organizer
//
//  Created by Administrator on 11/18/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

var students = [
    Student("Shantal Ewell"),
    Student("Keneisha Wiggan"),
    Student("Amarachi Kalu-Onuma"),
    Student("Ikenna Ngwu"),
    Student("Annakay Candice Evea"),
    Student("Ruby Birchiet"),
    Student ("Kamari Fransis"),
    Student ("Donald Green"),
    Student ("DeVonte Brown"),
    Student ("Anna Swanier"),
    Student ("Desmon Harris"),
    Student ("Isaiah Freeman"),
    Student ("Devon James"),
    Student ("Adarsh Greene"),
    Student ("Raquel Boulware"),
    Student ("Hayley Bailey"),
    Student ("DeAntre Robinson"),
    Student ("Tyler Brown"),
    Student ("Khyree Shaw"),
    Student ("Jasmine Mackenzie"),
    Student ("Mackenzie Brown"),
    Student ("Michael Harper"),
    Student ("Sagar Ghmire"),
    Student ("Stephone Jeffcote")
    
]

class MyClassViewController: UIViewController {
    
        let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground() 
        // Do any additional setup after loading the view.
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
