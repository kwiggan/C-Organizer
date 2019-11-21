//
//  AllNamesViewController.swift
//  C-Organizer
//
//  Created by Administrator on 11/18/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class AllNamesViewController: UIViewController {

//    var sNames = ["Shantal Ewell", "Keneisha Wiggan", "Amarachi Kalu-Onuma", "Ikenna Brown", "Ruby Birchiet"]
    var students = [
        Student("Shantal Ewell"),
        Student("Keneisha Wiggan"),
        Student("Amarachi Kalu-Onuma"),
        Student("Ikenna Brown"),
        Student("Ruby Birchiet")
    ]
    
   // let test = Array(sNames.filter { !" \n\t\r".contains($0) })
    
   
    @IBOutlet weak var averageLabel: UILabel!
    
    var sum = 0
    var segue = ""
    
//    let myString = " Hello World ! "
//    let formattedString = myString.replacingOccurrences(of: " ", with: "")
 
    @IBOutlet weak var studentsTable: UITableView!
    @IBOutlet weak var topicLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        averageLabel.isHidden = true
        
        switch segue{
        case "long":
             topicLabel.text = "Longest Name"
            if let max = students.max(by: {$1.name.count > $0.name.count}) {
                for (index, student) in students.enumerated() {
                    if student.length == max.length {
                        student.isLongestName = true
                    }
                }
            }
            
            
            case "total":
                 topicLabel.text = "Total Character in Names"
                for student in students {
                    let charCount = student.name.count
                    sum = charCount
                    print("The total character in \(student.name) is \(sum)")
                }
            
        case "average":
             topicLabel.text = "Average of All Names"
            averageLabel.isHidden = false
            for student in students {
                let charCount = student.name.count
            sum += charCount
            }
            let average:Double = Double(sum/students.count)
            averageLabel.text = "Average: \(average)"
            
        default:
            break
        }
        // Do any additional setup after loading the view.
    }

}

extension AllNamesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Students
        cell.name.text = students[indexPath.row].name
        
        if students[indexPath.row].isLongestName {
            cell.background.backgroundColor = UIColor.black
        }
        
        if segue == "total" {
            cell.totalChars.text = "Total char: \(students[indexPath.row].length)"
        }else {
            cell.totalChars.isHidden = true
        }
        
        return cell
    }
}

class Students: UITableViewCell {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var totalChars: UILabel!
}

class Student {
    var name: String
    var length: Int
    var isLongestName = false
    
    init(_ name: String){
        self.name = name
        self.length = name.count
    }
}


