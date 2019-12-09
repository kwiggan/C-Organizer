//
//  AllNamesViewController.swift
//  C-Organizer
//
//  Created by Administrator on 11/18/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class AllNamesViewController: UIViewController {

//Struc to hold all students names
    var showGrade = false
    
//    for char in students {
//
//    }
   // let test = Array(sNames.filter { !" \n\t\r".contains($0) })
    @IBOutlet weak var averageLabel: UILabel!
    let backgroundImageView = UIImageView()
    
    var sum = 0.0
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
                studentsTable.reloadData()
            }
            case "total":
                 topicLabel.text = "Total Character in Names"
                for student in students {
                    //counting char without white spaces
                    let charCount = (String(student.name.filter {!" ".contains($0)})).count
                    sum = Double(charCount)
                    print("The total character in \(student.name) is \(sum)")
                }
            
        case "average":
             topicLabel.text = "Average of All Names"
            averageLabel.isHidden = false
            for student in students {
                let charCount = student.name.count
            sum += Double(charCount)
            }
            let average:Double = sum / Double(students.count)
            averageLabel.text = "Average: \(average)"
            
        case "grade":
            topicLabel.text = "Add student grade"
            showGrade = true
            
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
        cell.index = indexPath.row
        cell.name.text = students[indexPath.row].name
        
        if students[indexPath.row].isLongestName {
            cell.background.backgroundColor = UIColor.black
        }
        
        if segue == "total" {
            cell.totalChars.text = "Total char: \(students[indexPath.row].length)"
        }else {
            cell.totalChars.isHidden = true
        }
        if showGrade {
            cell.grade.isHidden = false
            cell.grade.text = students[indexPath.row].grade
        }
        
        return cell
    }
}

class Students: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var totalChars: UILabel!
    @IBOutlet weak var grade: UITextField!
    var index: Int?
    
    override func awakeFromNib() {
        grade.isHidden = true
        grade.delegate = self
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        students[index!].grade = textField.text!
    }
}

class Student {
    var name: String
    var length: Int
    var isLongestName = false
    var grade = ""
    
    init(_ name: String){
        self.name = name
        self.length = (String(name.filter {!" ".contains($0)})).count
    }
}
