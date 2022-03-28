//
//  ViewController.swift
//  LifeCycle
//
//  Created by Renato F. dos Santos Jr on 24/03/22.
//

import UIKit

//class Content: UIView {
//    lazy var textLabel: UILabel = {
//        let label = UILabel()
//
//        label.text = "Label Text"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//}

class ViewController: UIViewController {

//    let content = Content()
    
    /*
     load -> viewDidLoad -> willAppear -> didAppear
     */
    
    override func loadView() {
        super.loadView()
        // nunca deve ser chamado diretamente
        // apenas quando suas popriedades são solicitadas
//        view = content
        print("loadView")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Chamado quando a classe é instanciada
        // muito usado
        print("viewDidLoad")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // toda vez q a view é chamada
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // toda vez que a view acaba de aparecer na tela
        // animações iniciais
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // encerrar animacoes?
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        // toda vez que a view

        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    @IBAction func getView() {
        print("getView")
        performSegue(withIdentifier: "segueUserViewController", sender: nil)
    }
}

