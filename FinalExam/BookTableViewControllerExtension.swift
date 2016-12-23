//
//  BookTableViewControllerExtension.swift
//  FinalExam
//
//  Created by LIN TINGMIN on 23/12/2016.
//  Copyright © 2016 MarkRobotDesignTEST. All rights reserved.
//

import UIKit
import Firebase

extension BookTableViewController{
    func readdataFromFirebase(){
         let ref = FIRDatabase.database().reference()
        ref.child("bookList").observeSingleEvent(of: .value, with: {
            (result) in
            let bookListCheck = result.value as! [String:Any]
            
            for (ID,data) in bookListCheck {
                let okData = data as! [String:Any]
                let name = okData["name"] as! String
                let address = okData["address"] as! String
                let phone = okData["phone"] as! String
                let web = okData["web"] as! String
                let picture = okData["picture"] as! String
                let introduction = okData["introduction"] as! String
                let bookID = ID
                self.bookList.append(Book(name: name, phone: phone, address: address, web: web, picture: picture, introduction: introduction, bookID:bookID))
                //print("book\(phone) \(web) \(picture) \(introduction))")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}
