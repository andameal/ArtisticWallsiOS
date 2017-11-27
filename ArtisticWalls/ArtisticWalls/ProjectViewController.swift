//
//  ProjectViewController.swift
//  ArtisticWalls
//
//  Created by Adam Neal on 11/15/17.
//  Copyright © 2017 Adam Neal. All rights reserved.
//

import UIKit
import os.log

class ProjectViewController: UIViewController, UITextFieldDelegate {

    // properties **
    @IBOutlet weak var nameTextField: UITextField!  // reference to inside textbox
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    //This value is either passed by `ProjectTableViewController` in `prepare(for:sender:)`
    //or constructed as part of adding a new project.
    var project: Project?
    

    // use the above to access values from Interface Builder-created objects
    
    // navigation **
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        
        // Set the project to be passed to ProjectTableViewController after the unwind segue.
        project = Project(name: name, location: "place", contact: "lady")


    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddProjectMode = presentingViewController is UINavigationController
        
        if isPresentingInAddProjectMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The ProjectViewController is not inside a navigation controller.")
        }
    }
    
    
    // actions **
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        //projectNameLabel.text = "Default Text"
        //projectCostLabel.text = "lotsa monies"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        if let project = project {
            navigationItem.title = project.name
            nameTextField.text = project.name
            // FIXME: add more properties of project
        }
        
        // Enable the Save button only if the text field has a valid Project name.
        updateSaveButtonState()
    }
    
    // UITextField Delegate ** textbox and keyboard protocol
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    
    // private methods **
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}

