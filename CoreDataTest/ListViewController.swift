//
//  ListViewController.swift
//  CoreDataTest
//
//  Created by admin on 08/04/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol DataPass {
    func data(object:[String:String], index:Int, isEdit:Bool)
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var listView: UITableView!
    var delegate:DataPass!
    
    var users = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        users = DatabaseHelper.shareInstance.getStudentData()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listView", for: indexPath) as! ListTableViewCell
        
        cell.user = users[indexPath.row]
        
//        cell.lblName.text = users[indexPath.row].name
//        cell.lblAddress.text = users[indexPath.row].address
//        cell.lblCity.text = users[indexPath.row].city
//        cell.lblMobile.text = users[indexPath.row].mobile

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            users = DatabaseHelper.shareInstance.deleteData(index: indexPath.row)
            self.listView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let dict:[String:String] = ["name":users[indexPath.row].name!,
                                    "address":users[indexPath.row].address!,
                                    "city":users[indexPath.row].city!,
                                    "mobile":users[indexPath.row].mobile!]
        
        delegate.data(object: dict, index: indexPath.row, isEdit: true)
        
        self.navigationController?.popViewController(animated: true)
    }

}
