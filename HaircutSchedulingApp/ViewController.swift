//
//  ViewController.swift
//  HaircutSchedulingApp
//
//  Created by Charles Salgado on 10/7/22.
//

import UIKit
import EventKit
import EventKitUI

class ViewController: // contents of viewcontroller
    UIViewController, EKEventEditViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var comments: UITextView!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var name: UITextField!
    
    let store = EKEventStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        comments.text = "Any comments about the time?"
    }
    
    
    @IBAction func confirmButton(_ sender: UIButton) {
        if datesScheduled.contains(datePicker.date)
        {
            let title = "Error"
            let message = "The date you are trying to choose has already been taken. Please select another time slot."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet);
            
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            alertController.addAction(okay)
            self.present(alertController, animated: true, completion: nil)
        }
        if let client = name.text
        {
            if (!client.isEmpty)
            {
                let title = "Confirm Date"
                let message = "Please check that info provided is correct. Date: \(datePicker.date.formatted()), Name: \(client)"
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet);
                
                let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                let confirm = UIAlertAction(title: "Okay", style: .default) { action in
                    let appt = appointments(date: self.datePicker.date ,questions: self.comments.text , name: client)
                    scheduledAppointments.append(appt)
                    datesScheduled.append(self.datePicker.date)
                    let conTitle = "Time Reserved"
                    let conMessage = "Please proceed to selecting the type of haircut you would like. From there you will be given a price."
                    
                    let confirmController = UIAlertController(title: conTitle, message: conMessage, preferredStyle: .alert)
                    
                    let cont = UIAlertAction(title: "Continue", style: .default, handler: nil)
                    //have the option to set the appointment within your own calender app

                    confirmController.addAction(cont)
                    self.present(confirmController, animated: true, completion: nil)
                }
                alertController.addAction(confirm)
                alertController.addAction(cancel)
                present(alertController, animated: true, completion: nil)
            }
            else
            {
                let title = "Error"
                let message = "Please enter your name."
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet);
                let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
                
                alertController.addAction(okay)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
    //dismiss textfield keyboard
    @IBAction func editEnd(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    //dismiss textview keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
}
