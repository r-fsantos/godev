//
//  ViewController.swift
//  navegation
//
//  Created by Douglas Nunes on 15/03/22.
//

import UIKit

struct Data {
	var name: String
	var age: Int
}

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Primeira View"
		
	}

	@IBAction func secondView(_ sender: Any) {
		
		let sender = Data(name: "Douglas", age: 39)
		
		performSegue(withIdentifier: "secondViewController", sender: sender)
		
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "secondViewController" {
			
			if let secondViewController = segue.destination as? secondViewController {
				print("Second view Controller: \(secondViewController)")
				
				secondViewController.property = sender as? Data
				
			}
			
		}
	}
	
}

