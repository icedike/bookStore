//
//  BookTableViewController.swift
//  FinalExam
//
//  Created by LIN TINGMIN on 23/12/2016.
//  Copyright © 2016 MarkRobotDesignTEST. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseDatabase
class BookTableViewController: UITableViewController {

    @IBOutlet weak var refreshAction: UIRefreshControl!
    
    var bookList:[Book] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        readdataFromFirebase()
        NotificationCenter.default.addObserver(self, selector: #selector(self.receiveNotification), name: NSNotification.Name(rawValue: "addTable"), object: nil)
        
        self.refreshControl?.addTarget(self, action: #selector(self.endreFresh), for: .valueChanged)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    func endreFresh(){
        bookList = []
        readdataFromFirebase()
        refreshAction.endRefreshing()
    }
    
    func receiveNotification(notification:Notification){
        let info = notification.userInfo as! [String:String]
        let book = Book(name: info["name"]!, phone: info["phone"]!, address: info["address"]!, web: info["web"]!, picture: info["picture"]!, introduction: info["introduction"]!,bookID: info["bookID"]!)
        bookList.insert(book, at: 0)
        DispatchQueue.main.async {
            let index = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [index], with: .fade)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookTableViewCell
        cell.bookName.text = bookList[indexPath.row].name
        let url = URL(string: bookList[indexPath.row].picture)
        cell.bookImage.sd_setImage(with:url!)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailTableViewController") as! DetailTableViewController
        
        controller.book = bookList[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            let ref = FIRDatabase.database().reference()
            ref.child("bookList/\(bookList[indexPath.row].bookID)").setValue(nil)
            bookList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }


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
