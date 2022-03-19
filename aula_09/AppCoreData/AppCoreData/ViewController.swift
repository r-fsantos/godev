//
//  ViewController.swift
//  AppCoreData
//
//  Created by Renato F. dos Santos Jr on 17/03/22.
//

import UIKit
import CloudKit

class ViewController: UIViewController {
    
    var persons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        let person = Person(id: UUID(), name: "Renato", lastName: "Júnior", age: 26)
        
        ManagedObjectContext.shared.save(person: person) { print($0) }
        
    }

    @IBAction func delete() {
        let id = "0464905C-02BA-4E18-9EEE-1D4FD4599BB2"
        
        ManagedObjectContext.shared.delete(uuid: id) { print($0) }
    }
    
    @IBAction func getPersons() {
        persons = ManagedObjectContext.shared.getPersons()
        
        print(persons)
    }

}

