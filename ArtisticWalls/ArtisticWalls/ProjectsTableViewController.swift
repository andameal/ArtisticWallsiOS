//
//  ProjectsTableViewController.swift
//  ArtisticWalls
//
//  Created by Brandon Toppins on 11/30/17.
//  Copyright © 2017 Adam Neal. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class ProjectsTableViewController: UITableViewController {

    var dbRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dbRef = Database.database().reference().child("project-items")
    }
    @IBAction func addProject(_ sender: Any) {
        let projectAlert = UIAlertController(title: "New Project", message: "Enter Project Name", preferredStyle: .alert)
        
        projectAlert.addTextField { (textField:UITextField) in
            textField.placeholder = "Your Project"
        }
        projectAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action:UIAlertAction) in
            if let projectContent = projectAlert.textFields?.first?.text {
                let project = Project(content: projectContent, addedByUser: "Brandon Toppins")
                let projectRef = self.dbRef.child(projectContent.lowercased())
                
                projectRef.setValue(project.toAny())
            }
        }))
        
        self.present(projectAlert, animated: true, completion: nil)
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }
}
/*
@IBAction func addProject(_ sender: Any) {
    let projectAlert = UIAlertController(title: "New Project", message: "Enter Project Name", preferredStyle: .alert)
    
    projectAlert.addTextField { (textField:UITextField) in
        textField.placeholder = "Your Project"
    }
    projectAlert.addAction(UIAlertAction(title: "Send", style: .default, handler: { (action:UIAlertAction) in
        if let projectContent = projectAlert.textFields?.first?.text {
            let project = Project(content: projectContent, addedByUser: "Brandon Toppins")
            let projectRef = self.dbRef.child(projectContent.lowercased())
            
            projectRef.setValue(project.toAny())
        }
    }))
    
    self.present(projectAlert, animated: true, completion: nil)
}
*/
