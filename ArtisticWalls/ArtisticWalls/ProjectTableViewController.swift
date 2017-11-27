//
//  ProjectTableViewController.swift
//  ArtisticWalls
//
//  Created by Adam Neal on 11/15/17.
//  Copyright © 2017 Adam Neal. All rights reserved.
//

import UIKit
import os.log

class ProjectTableViewController: UITableViewController {

    
    var projects = [Project]()
    
    // actions **
    @IBAction func unwindToProjectList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as?
            ProjectViewController, let project = sourceViewController.project {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing project
                projects[selectedIndexPath.row] = project
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // add a new project
                let newIndexPath = IndexPath(row: projects.count, section: 0)
                
                projects.append(project)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
    private func loadSampleProjects() {
        
        let project1 = Project(name: "My First Project", location: "NYC", contact: "867-5309")
        let project2 = Project(name: "Big Paint Job", location: "Next Door", contact: "Girl")
        
        projects.append(project1!)
        projects.append(project2!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // sample data
        loadSampleProjects()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // return the number of columns
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows
        return projects.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "ProjectTableViewCell"

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ProjectTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ProjectTableViewCell.")
        }
        
        // Fetches the appropriate project for the data source layout.
        let project = projects[indexPath.row]
        
        // Configure the cell
        cell.nameLabel.text = project.name
        cell.costLabel.text = "Cost: " + String(project.cost)

        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            projects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // For a storyboard-based application, preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new project.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let projectDetailViewController = segue.destination as? ProjectViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedProjectCell = sender as? ProjectTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedProjectCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedProject = projects[indexPath.row]
            projectDetailViewController.project = selectedProject
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
}
