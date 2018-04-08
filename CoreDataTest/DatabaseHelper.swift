//
//  DatabaseHelper.swift
//  CoreDataTest
//
//  Created by admin on 08/04/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper {
    
    static var shareInstance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    func Save(object:[String:String]) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        
        user.name = object["name"]
        user.address = object["address"]
        user.city = object["city"]
        user.mobile = object["mobile"]
        
        do{
            try context?.save()
        }catch{
            print("Record not saved")
        }
    }
}
