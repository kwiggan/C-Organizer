//
//  loginViewController.swift
//  C-Organizer
//
//  Created by Emmanuel Gyekye Atta-Penkra on 11/22/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

var nameText = ""

extension UITextField {
    
    func setPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftViewMode = .always
        
    }
    func setBottomBorder() {
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
class LoginViewController: UIViewController {
    let backgroundImageView = UIImageView()
    

    @IBOutlet var textField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        textField.setPadding()
        textField.setBottomBorder()
        emailTextField.setBottomBorder()
        emailTextField.setPadding()
        passwordTextField.setBottomBorder()
        passwordTextField.setPadding()
        
        mainButton.layer.cornerRadius = mainButton.frame.height / 6
        mainButton.setTitleColor(UIColor.white, for: .normal)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func done(_ sender: Any) {
        nameText = textField.text!
        performSegue(withIdentifier: "name2", sender: self)
        
    }
    
    func setBackground() {
           view.addSubview(backgroundImageView)
           backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
           backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
           backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
           backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
           backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

          // backgroundImageView.image = UIImage (named: "background4")

           view.sendSubviewToBack(backgroundImageView)
       }
    


}
