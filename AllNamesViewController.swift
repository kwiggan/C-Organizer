//
//  AllNamesViewController.swift
//  C-Organizer
//
//  Created by Administrator on 11/18/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class AllNamesViewController: UIViewController {

    var sNames = ["Shantal Ewell", "Keneisha Wiggan", "Amarachi Kalu-Onuma", "Ikenna Brown", "Ruby Birchiet"]
    
    var sum = 0
    var segue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch segue{
        case "long":
            if let max = sNames.max(by: {$1.count > $0.count}) {
                print(max)
            }
            case "total":
            for character in sNames{
                let charCount = character.count
                sum = charCount
                print("The total character is: \(sum)")
            }
        case "average":
            for character in sNames{
            let charCount = character.count
            sum += charCount
            }
            let average:Double = Double(sum/sNames.count)
            print("The average of the names is: \(average)")
            
        default:
            break
        }
        // Do any additional setup after loading the view.
    }

}

extension AllNamesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Students
        cell.name.text = sNames[indexPath.row]
        return cell
    }
}

class Students: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
}
