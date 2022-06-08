//
//  ViewController.swift
//  EmployeeSkillsTracker
//
//  Created by Ashlesha Kamble on 02/06/22.
//***

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var sideTableView: UITableView!
    
    let sideMenu = ["Home","Create Profile","Logout"]
    var isSideBarOpen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView?.tintColor = UIColor.systemTeal
                
        sideView.isHidden = true
        sideTableView.isHidden = true
        
        sideTableView.dataSource = self
        sideTableView.delegate = self
        
    }
    
    @IBAction func tapToSlide (_sender: UIButton) {
        
                sideView.isHidden = false
                sideTableView.isHidden = false
                self.view.bringSubviewToFront(sideView)
        
                if !isSideBarOpen {
                    isSideBarOpen = true
                    sideView.frame = CGRect(x: 0, y: 0, width: 0, height: 281)
                    sideTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 281)
                    UIView.animate( withDuration: 0.5, delay: 0.3) { [weak self] in
                        self?.view.layoutIfNeeded()
                    }
                    sideView.frame = CGRect(x: 0, y: 0, width: 232, height: 281)
                    sideTableView.frame = CGRect(x: 0, y: 0, width: 232, height: 281)
                 
                } else {
                    sideView.isHidden = true
                    sideTableView.isHidden = true
                    isSideBarOpen = false
                    
                    sideView.frame = CGRect(x: 0, y: 0, width: 232, height: 281)
                    sideTableView.frame = CGRect(x: 0, y: 0, width: 232, height: 281)
                    UIView.animate( withDuration: 0.5, delay: 0.3) { [weak self] in
                        self?.view.layoutIfNeeded()
                    }
                    sideView.frame = CGRect(x: 0, y: 0, width: 0, height: 281)
                    sideTableView.frame = CGRect(x: 0, y: 0, width: 0, height: 281)
                    
                }
    }
   


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sideMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) 
            cell.textLabel?.text = sideMenu[indexPath.row]
            return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0:
            let home = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            navigationController?.pushViewController(home, animated: true)
            
        case 1:
            let createProfile = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileViewController") as! CreateProfileViewController
            navigationController?.pushViewController(createProfile, animated: true)
        default:
            return
        }
    }
    
    
}

