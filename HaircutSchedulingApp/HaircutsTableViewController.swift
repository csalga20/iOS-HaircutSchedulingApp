//
//  HaircutsTableViewController.swift
//  HaircutSchedulingApp
//
//  Created by Charles Salgado on 10/7/22.
//

import UIKit

class HaircutsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return haircutStyles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let haircut = haircutStyles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: haircut.type.rawValue, for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = haircut.type.rawValue
        cell.detailTextLabel?.text = "$\(haircut.price)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let haircut = haircutStyles[indexPath.row]
        let title = haircut.type.rawValue
        let info = haircut.shortDescription
        let alertController = UIAlertController(title: title, message: info, preferredStyle: .alert)
        let okayAct = UIAlertAction(title: "Back", style: .default, handler: nil)
        let select = UIAlertAction(title: "Select Style", style: .default) { action in
            let price = haircutStyles[indexPath.row].price
            let style = haircutStyles[indexPath.row].type.rawValue
            haircutPrices.append(price)
            haircutTypes.append(style)
            let title = "Hairstyle Selected"
            let information = "Your total is: $\(price). (Tips are not necessary, but greatly appreciated)"
            let alertController = UIAlertController(title: title, message: information, preferredStyle: .actionSheet)
            let okayAct = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            alertController.addAction(okayAct)
            self.present(alertController, animated: true, completion: nil)
        }
        alertController.addAction(okayAct)
        alertController.addAction(select)
        present(alertController, animated: true, completion: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let haircut = haircutStyles[indexPath.row]
        let title = haircut.type.rawValue + " $\(haircut.price)"
        let information = haircut.longDescription
        let alertController = UIAlertController(title: title, message: information, preferredStyle: .actionSheet)
        let okayAct = UIAlertAction(title: "Back", style: .default, handler: nil)
        let select = UIAlertAction(title: "Select Style", style: .default) { action in
            let price = haircutStyles[indexPath.row].price
            let style = haircutStyles[indexPath.row].type.rawValue
            haircutPrices.append(price)
            haircutTypes.append(style)
            let title = "Hairstyle Selected"
            let information = "Your total is: $\(price). (Tips are not necessary, but greatly appreciated)"
            let alertController = UIAlertController(title: title, message: information, preferredStyle: .actionSheet)
            let okayAct = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            alertController.addAction(okayAct)
            self.present(alertController, animated: true, completion: nil)
        }

        alertController.addAction(select)
        alertController.addAction(okayAct)

        present(alertController, animated: true, completion: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
