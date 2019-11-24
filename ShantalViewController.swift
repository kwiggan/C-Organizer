//
//  ViewController.swift
//  C-Organizer
//
//  Created by Emmanuel Gyekye Atta-Penkra on 11/11/19.
//  Copyright © 2019 Keneisha Wiggan. All rights reserved.
//

import UIKit

class ShantalViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    
    
    var button = dropDownBtn()
    let backgroundImageView = UIImageView()

        override func viewDidLoad() {
            nameLabel.text = "Hey, " + nameText
            setBackground() 
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            
            //Configure the button
            button = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            button.setTitle("Select Class", for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            //Add Button to the View Controller
            self.view.addSubview(button)
            
            //button Constraints
            button.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 240).isActive = true

            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true

            button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 20).isActive = true
//            button.centerXAnchor.constraint(equalTo: self.view.leftXAnchor).isActive = true
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            button.widthAnchor.constraint(equalToConstant: 250).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            //Set the drop down menu's options
            button.dropView.dropDownOptions = ["Intro to Programming", "Data Structures & Algorithm", "Computer Architecture", "Information Assurance", "Software Engineering", "Probability & Statistics"]
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
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    }

    protocol dropDownProtocol {
        func dropDownPressed(string : String)
    }

    class dropDownBtn: UIButton, dropDownProtocol {
        
        func dropDownPressed(string: String) {
            self.setTitle(string, for: .normal)
            self.dismissDropDown()
        }
        
        var dropView = dropDownView()
        
        var height = NSLayoutConstraint()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            self.backgroundColor = UIColor.darkGray
            
            dropView = dropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
            dropView.delegate = self
            dropView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        override func didMoveToSuperview() {
            self.superview?.addSubview(dropView)
            self.superview?.bringSubviewToFront(dropView)
            dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
            height = dropView.heightAnchor.constraint(equalToConstant: 0)
        }
        
        var isOpen = false
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if isOpen == false {
                
                isOpen = true
                
                NSLayoutConstraint.deactivate([self.height])
                
                if self.dropView.tableView.contentSize.height > 150 {
                    self.height.constant = 150
                } else {
                    self.height.constant = self.dropView.tableView.contentSize.height
                }
                
                
                NSLayoutConstraint.activate([self.height])
                
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                    self.dropView.layoutIfNeeded()
                    self.dropView.center.y += self.dropView.frame.height / 2
                }, completion: nil)
                
            } else {
                isOpen = false
                
                NSLayoutConstraint.deactivate([self.height])
                self.height.constant = 0
                NSLayoutConstraint.activate([self.height])
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                    self.dropView.center.y -= self.dropView.frame.height / 2
                    self.dropView.layoutIfNeeded()
                }, completion: nil)
                
            }
        }
        
        func dismissDropDown() {
            isOpen = false
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource  {
        
        var dropDownOptions = [String]()
        
        var tableView = UITableView()
        
        var delegate : dropDownProtocol!
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            tableView.backgroundColor = UIColor.darkGray
            self.backgroundColor = UIColor.darkGray
            
            
            tableView.delegate = self
            tableView.dataSource = self
            
            tableView.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(tableView)
            
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
            tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dropDownOptions.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            
            cell.textLabel?.text = dropDownOptions[indexPath.row]
            cell.backgroundColor = UIColor.darkGray
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
            self.tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }




