//
//  ShowAnswerViewController.swift
//  C-Organizer
//
//  Created by Keneisha Wiggan on 12/8/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class ShowAnswerViewController: UIViewController {

    @IBOutlet weak var showAnswer: UILabel!
    //create variable to display the text
    var myString = String()
    var myStringTwo = String()
    var myStringThree = String()
    var myStringFour = String()
    
    
    @IBOutlet weak var output0ne: UILabel!
    @IBOutlet weak var outputTwo: UILabel!
    @IBOutlet weak var outputThree: UILabel!
    @IBOutlet weak var outputFour: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign text of the label to equal the variable name myString
        output0ne.text = myString
        outputTwo.text = myStringTwo
        outputThree.text = myStringThree
        outputFour.text = myStringFour
        
        
       // showAnswer.text = "\(myScore)"
      
    }
    

    

}
