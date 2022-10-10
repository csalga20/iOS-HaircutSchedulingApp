//
//  MessagingViewController.swift
//  HaircutSchedulingApp
//
//  Created by Charles Salgado on 10/7/22.
//

import UIKit
import MessageUI
import SafariServices

class MessagingViewController: UIViewController, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func emailButton(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail()
        {
            let composeVC = MFMailComposeViewController()
            composeVC.mailComposeDelegate = self
            
            composeVC.setToRecipients(["salgadocharlie@gmail.com"])
            composeVC.setSubject("Haircut Contact")
            composeVC.setPreferredSendingEmailAddress("youremail@mail.com")
            self.present(composeVC, animated: true, completion: nil)
            
        }
        else //error
        {
            let title = "E-mail N/A"
            let message = "Sorry but mail services are not available on your iOS device."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAct = UIAlertAction(title: "Okay", style: .default, handler: nil)
            let sendOnlineAct = UIAlertAction(title: "Send through safari", style: .default) { action in
                guard let url = URL(string: "https://www.google.com") else
                {
                    return
                }
                let composeVC = SFSafariViewController(url: url)
                self.present(composeVC, animated: true)
                
            }

            alertController.addAction(okayAct)
            alertController.addAction(sendOnlineAct)

            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func textButton(_ sender: UIButton) {
        if MFMessageComposeViewController.canSendText()
        {
            let composeVC = MFMessageComposeViewController()
            composeVC.messageComposeDelegate = self
            
            composeVC.recipients = ["7083101436"]
            if !scheduledAppointments.isEmpty
            {
                composeVC.body = "Hello from  \(scheduledAppointments.last?.name ?? "Hello, no name found")"}
            self.present(composeVC, animated: true, completion: nil)
        }
        else //error
        {
            let title = "Messages N/A"
            let message = "Sorry but messaging services are not available on your iOS device."
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okayAct = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(okayAct)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
