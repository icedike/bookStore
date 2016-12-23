//
//  Book.swift
//  FinalExam
//
//  Created by LIN TINGMIN on 23/12/2016.
//  Copyright © 2016 MarkRobotDesignTEST. All rights reserved.
//

import Foundation

class Book{
    var name:String = String()
    var phone:String = String()
    var address:String = String()
    var web:String = String()
    var picture:String = String()
    var introduction:String = String()
    var bookID:String = String()
    init(name:String,phone:String,address:String,web:String,picture:String,introduction:String,bookID:String){
        self.name = name
        self.phone = phone
        self.address = address
        self.web = web
        self.picture = picture
        self.introduction = introduction
        self.bookID = bookID
    }
    init(){
    }
}
