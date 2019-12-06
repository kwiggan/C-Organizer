//
//  ProfileViewController.swift
//  Par
//
//  Created by Edi Rangel on 7/25/19.
//  Copyright © 2019 Snack Pacl. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
    let backgroundImageView = UIImageView()
    
    @IBOutlet var pImage: UIImageView!
    
    
    @IBAction func buttonProfile(_ sender: Any) {
        let image = UIImagePickerController ()
                image.delegate  = self
                image.sourceType = UIImagePickerController.SourceType.photoLibrary
                image.allowsEditing = false
        
                self.present(image, animated: true){
                    //After it is compiled
                }
    }
   
     
     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let defaults = UserDefaults.standard
            let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            {
                pImage.image = image
                
            }else{
                //Error Message
            }
            
            let saveImage = image.pngData() as NSData?
            defaults.set(saveImage, forKey: "test")  // saving image into userdefault
            
            self.dismiss(animated: true, completion: nil)
        }


    //Actualling storing (In ViewDidLoad)

     // for retrieving the image
            
            

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pImage.imageProfile()
        //setBackground()
        
        if (UserDefaults.standard.object(forKey: "test") as? NSData) != nil {
            let photo = UserDefaults.standard.object(forKey: "test") as! NSData
            pImage.image = UIImage(data: photo as Data) // pImage set your imageview on which you want photo to appear

        }

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
@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}

