//
//  ViewController.swift
//  TestNavigation
//
//  Created by Renato F. dos Santos Jr on 22/03/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "App 1"
        
        view.backgroundColor = .orange
    }
    
    @IBAction func getViewController() {
    // Primeiro passo para criar navegacao: Criar URL
        let customUrl = "NavigationSchema://"
        
        /*
         URL != NSURL
         String != NSString
         */
        if let url = URL(string: customUrl) {
            // verificar se pode ser aberto!
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }


}

