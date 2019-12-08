//
//  CreateTestQuestionsViewController.swift
//  C-Organizer
//
//  Created by Keneisha Wiggan on 12/8/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class CreateTestQuestionsViewController: UIViewController {
    @IBOutlet weak var inputOne: UITextField!
    
    @IBOutlet weak var inputTwo: UITextField!
    @IBOutlet weak var inputThree: UITextField!
    
    @IBOutlet weak var inputFour: UITextField!

    
    @IBAction func submit(_ sender: Any)
    {
        if inputOne.text != ""
        {
            performSegue(withIdentifier: "segue", sender: self)
        }
       if inputTwo.text != ""
              {
                  performSegue(withIdentifier: "segue", sender: self)
              }
        if inputThree.text != ""
               {
                   performSegue(withIdentifier: "segue", sender: self)
               }
        if inputFour.text != ""
               {
                   performSegue(withIdentifier: "segue", sender: self)
               }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
       //connect the data from the textfield to the questions view controller
        var secondController = segue.destination as! ShowAnswerViewController
        secondController.myString = inputOne.text!
        var secondControllerTwo = segue.destination as! ShowAnswerViewController
               secondController.myStringTwo = inputTwo.text!
        var secondControllerThree = segue.destination as! ShowAnswerViewController
               secondController.myStringThree = inputThree.text!
        var secondControllerFour = segue.destination as! ShowAnswerViewController
               secondController.myStringFour = inputFour.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    

}
