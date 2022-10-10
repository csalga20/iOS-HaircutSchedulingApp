//
//  ConfirmationRecommendationView.swift
//  HaircutSchedulingApp
//
//  Created by Charles Salgado on 10/7/22.
//


import UIKit
import EventKit
import EventKitUI

class ConfirmationRecommendationView: UIViewController, EKEventEditViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var paymentPicker: UIPickerView!
    
    @IBOutlet weak var hairtypeField: UITextField!
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    
    let store = EKEventStore()
    var selectedPayment = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        paymentPicker.dataSource = self
        paymentPicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !scheduledAppointments.isEmpty
        {
            nameField.text = scheduledAppointments.last?.name
            dateField.text = scheduledAppointments.last?.time.formatted()
            hairtypeField.text = "$\(haircutPrices.last ?? 0) \(haircutTypes.last ?? "None")"
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        if !scheduledAppointments.isEmpty && hairtypeField.text != nil
        {
            let title = "Booked"
            let message = "The appointment has confirmed and updated. Your payment option has been set to \(selectedPayment). Would you like to add this event to your calender?"
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet);
            
            let no = UIAlertAction(title: "No", style: .default) { action in
                let title = "Thank you"
                let message = "I look forward to meeting with you. "
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert);
                let ret = UIAlertAction(title: "Return", style: .default, handler: nil)
                
                alertController.addAction(ret)
                self.present(alertController, animated: true, completion: nil)
            }
            let setCalender = UIAlertAction(title: "Set Calender", style: .default) { action in
                self.store.requestAccess(to: .event) { [weak self] success, error in
                    if success, error == nil {
                        DispatchQueue.main.async {
                            guard let store = self?.store else { return }
                            
                            let newEvent = EKEvent(eventStore: store)
                            newEvent.title = "Haircut Appointment"
                            newEvent.startDate = datesScheduled[0]
                            newEvent.endDate = datesScheduled[0].addingTimeInterval(900)

                            let composeCalender = EKEventEditViewController()
                            composeCalender.editViewDelegate = self
                            composeCalender.eventStore = store
                            composeCalender.event = newEvent
                            self?.present(composeCalender, animated: true)
                        }
                    }
                }
            }
            
            alertController.addAction(no)
            alertController.addAction(setCalender)

            self.present(alertController, animated: true, completion: nil)
        }
        else
        {
            let title = "Error"
            let message = "Please reserve a time slot and choose the hairstyle that you like. Thank you."
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert);
            let okay = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alertController.addAction(okay)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return payments.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return payments[row]
    }
    func eventEditViewController(_ controller: EKEventEditViewController, didCompleteWith action: EKEventEditViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
    // Capture the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row and component represents what was selected.
        selectedPayment = payments[row]
    }
    @IBAction func editEnded(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func editEndedDate(_ sender: UITextField) {
    }
    @IBAction func editEndedHairtype(_ sender: UITextField) {
    }
}
