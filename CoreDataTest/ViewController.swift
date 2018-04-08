//
//  ViewController.swift
//  CoreDataTest
//
//  Created by admin on 08/04/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnShowAll: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // First Commit has been done.
    }

    @IBAction func btnSaveClick(_ sender: Any) {
        let dict = ["name":txtName.text,"address":txtAddress.text,"city":txtCity.text,"mobile":txtMobile.text]
        
        DatabaseHelper.shareInstance.Save(object: dict as! [String : String])
    }
    
    @IBAction func btnShowAllClick(_ sender: Any) {
        
    }
    

}

