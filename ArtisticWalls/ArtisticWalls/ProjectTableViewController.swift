//
//  ProjectTableViewController.swift
//  ArtisticWalls
//
//  Created by Adam Neal on 11/15/17.
//  Copyright © 2017 Adam Neal. All rights reserved.
//

import UIKit

class ProjectTableViewController: UITableViewController {

    
    var projects = [Project]()
    
    private func loadSampleProjects() {
        
        let project1 = Project(name: "My First Project", location: "NYC", contact: "867-5309")
        let project2 = Project(name: "Big Paint Job", location: "Next Door", contact: "Girl")
        
        projects.append(project1!)
        projects.append(project2!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        cell.costLabel.text = String(project.cost)

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
