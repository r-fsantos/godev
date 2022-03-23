//
//  ViewController.swift
//  NavigationSchema
//
//  Created by Renato F. dos Santos Jr on 22/03/22.
//

import UIKit
// AME americanas. Gateway de pagamentos.
import MessageUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "App 2"
        
        view.backgroundColor = .systemIndigo
    }

    @IBAction func getMaps() {
        let schemes = "maps://"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) { // isInstalled ?
                UIApplication.shared.open(url)
            }
        }
    }
    @IBAction func getSafari() {
        let schemes = "safari://"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) { // isInstalled ?
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getNumberPhone() {
        
        let schemes = "tel://+55(61)996489726"
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) { // isInstalled ?
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func getEmail() {
        let recipient = "felicio95.jr@gmail.com"
        let subject = "Test Navigation Schema go!dev"
        let body = "Some email body or Lorem Ipsum"
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            
            mail.mailComposeDelegate = self // vai subir uma janela. dentro dela eu tenho controle sobre o que aconteceu. sucesso, falha, infos...
            mail.setCcRecipients([recipient])
            mail.setSubject(subject)
            mail.setMessageBody(body, isHTML: false)
            
            present(mail, animated: true)
        }
    }
    
    private func createEmail(to: String, subject: String, body: String) {
        var schemes = ""
        
        if let subjectEncoded = subject.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let bodyEncoded = body.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            schemes = ""
        }
        
        if let url = URL(string: schemes) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
}

extension ViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // acesso aos resultos...
        
        switch result {
        case .cancelled:
            print("cancelled")
        case .saved:
            print("saved")
        case .sent:
            print("sent")
        case .failed:
            print("failed")
        @unknown default:
            print("deafult")
        }
     }
}
