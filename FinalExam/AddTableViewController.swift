//
//  AddTableViewController.swift
//  FinalExam
//
//  Created by LIN TINGMIN on 23/12/2016.
//  Copyright © 2016 MarkRobotDesignTEST. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddTableViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var pictureTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    @IBOutlet weak var webTextField: UITextField!
    @IBOutlet weak var introductionTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addBook(_ sender: UIBarButtonItem) {
        let ref = FIRDatabase.database().reference()
        let booknumber = String(describing: Date())
        ref.child("bookList/\(booknumber)/name").setValue(nameTextField.text)
        ref.child("bookList/\(booknumber)/phone").setValue(phoneTextField.text)
        ref.child("bookList/\(booknumber)/picture").setValue(pictureTextField.text)
        ref.child("bookList/\(booknumber)/web").setValue(webTextField.text)
        ref.child("bookList/\(booknumber)/address").setValue(addressTextField.text)
        ref.child("bookList/\(booknumber)/introduction").setValue(introductionTextField.text)
        
        let info = ["name":nameTextField.text!,"phone":phoneTextField.text!,"picture":pictureTextField.text!,"web":webTextField.text!,"address":addressTextField.text!,"introduction":introductionTextField.text!,"bookID": booknumber]
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addTable"), object: nil, userInfo: info)
       _ = navigationController?.popViewController(animated: true)
        
    }
    // MARK: - Table view data source


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
