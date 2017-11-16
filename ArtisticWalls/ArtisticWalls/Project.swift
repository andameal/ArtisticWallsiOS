//
//  Project.swift
//  ArtisticWalls
//
//  Created by Adam Neal on 11/15/17.
//  Copyright © 2017 Adam Neal. All rights reserved.
//

import UIKit

class Project {
    
    // properties
    var name: String = "Project Name"
    var location: String = ""
    var contact: String = ""
    var cost: Double = 0
    var components = [Component]()
    
    
    init?(name: String, location: String, contact: String) {
        
        
        // Initialize stored properties.
        self.name = name
        self.location = location
        self.contact = contact
        cost = 0
    }
    
    func addComponent() {
        //components.append(
    }
}
