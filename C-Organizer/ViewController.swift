//
//  ViewController.swift
//  C-Organizer
//
//  Created by Keneisha Wiggan on 11/6/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let questions = ["What is Scrum?", "Whats in sprint review?", "where is claflin located?"]
    let answers = [["Agile Methodology", "An App", "Sprint Review"], ["userstory","name","grade"], ["Orangeburg","New York","Tennesse"]]
    
    //Varibles
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    //variable the counts the number of points
    var points = 0;
    var score: Int = 0
    
    
//Label
    @IBOutlet weak var label: UILabel!
   
    //Button
    @IBAction func action(_ sender: Any)
    {
        if ((sender as AnyObject).tag == Int(rightAnswerPlacement))
        {
            print("Right answer! Good Job!")
            points += 1
        }
        else
        {
            print ("Wrong Answer!, try again")
        }
        if (currentQuestion != questions.count)
        {
            newQuestions()
        }
            
        else
           {
           performSegue(withIdentifier: "showScore", sender: self)
           }
    }
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestions()
    }
   
    //Function that displays questions
   func newQuestions()
   {
    label.text = questions[currentQuestion]
    
    rightAnswerPlacement = arc4random_uniform(3)+1
    
    //Create a button
    var button:UIButton = UIButton()
    
    var x = 1
    for i in 1...3
    {
        //Create a button
        button = view.viewWithTag(i) as! UIButton
        if (i == Int(rightAnswerPlacement))
        {
            button.setTitle(answers[currentQuestion][0], for: .normal)
        }
        else
        {
            button.setTitle(answers[currentQuestion][x], for: .normal)
            x = 2
        }
       
    }
     currentQuestion += 1
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //testing
       
    }


}

