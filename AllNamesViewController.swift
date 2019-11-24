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
    var students = [
        Student("Shantal Ewell"),
        Student("Keneisha Wiggan"),
        Student("Amarachi Kalu-Onuma"),
        Student("Ikenna Brown"),
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
        setBackground()
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
            
        default:
            break
        }
        // Do any additional setup after loading the view.
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
        self.length = (String(name.filter {!" ".contains($0)})).count
    }
}


