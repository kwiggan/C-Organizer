//
//  imageProfile.swift
//  Par
//
//  Created by shantal ewell on 7/26/19.
//  Copyright © 2019 Snack Pacl. All rights reserved.
//

import UIKit

extension UIImageView{
    
    func imageProfile () {
        //self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = self.frame.size.width/30
    }
    
    func circularImage () {
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        //.self.layer.borderColor = UIColor.lightGray.cgColor
       // self.layer.borderWidth = self.frame.size.width/30
    }
}

