//
//  ViewController.swift
//  ArtisticWalls
//
//  Created by Adam Neal on 11/15/17.
//  Copyright © 2017 Adam Neal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // properties
    @IBOutlet weak var nameTextField: UITextField!  // reference to inside textbox
    @IBOutlet weak var projectNameLabel: UILabel!   // ref label
    @IBOutlet weak var projectCostLabel: UILabel!   // ref label

    // use the above to access values from Interface Builder-created objects
    
    // actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        projectNameLabel.text = "Default Text"
        projectCostLabel.text = "lotsa monies"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
    }
    
    // UITextField Delegate - textbox and keyboard protocol
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        projectNameLabel.text = textField.text
    }

}

