//
//  ViewController.swift
//  CoreDataTest
//
//  Created by admin on 08/04/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DataPass {
    
    
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnShowAll: UIButton!
    
    var index = Int()
    var isEdit = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // First Commit has been done.
        btnSave.titleLabel?.text = "Save"
    }

    @IBAction func btnSaveClick(_ sender: Any) {
        let dict = ["name":txtName.text,"address":txtAddress.text,"city":txtCity.text,"mobile":txtMobile.text]
        
        if isEdit {
            
        }else {
            DatabaseHelper.shareInstance.Save(object: dict as! [String : String])
        }
    }
    
    @IBAction func btnShowAllClick(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "ListViewControllerID") as! ListViewController
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    func data(object: [String : String], index: Int, isEdit: Bool) {
        
        btnSave.titleLabel?.text = "Update"
        
        txtName.text = object["name"]
        txtAddress.text = object["address"]
        txtCity.text = object["city"]
        txtMobile.text = object["mobile"]
        
        self.index = index
        self.isEdit = isEdit
    }
}

