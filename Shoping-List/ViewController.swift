//
//  ViewController.swift
//  Shoping-List
//
//  Created by Yan Malinovsky on 27.10.16.
//  Copyright © 2016 Yan Malinovsky. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var items:[String] = [String]()
    
    @IBOutlet var inputField: UITextField!
    
    @IBAction func addButton(_ sender: UIButton) {
        let newItem:String = inputField.text!
        if newItem != ""{
            items.append(newItem)
            inputField.resignFirstResponder()
            inputField.text = ""
            tableView.reloadData()
        }
    }
    
    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "items_cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = UIColor.red
        
        return cell; 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRow:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if selectedRow.accessoryType == UITableViewCellAccessoryType.none {
            selectedRow.accessoryType = UITableViewCellAccessoryType.checkmark
            selectedRow.tintColor = UIColor.green
        } else {
            selectedRow.accessoryType = UITableViewCellAccessoryType.none
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let deleteRow:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            deleteRow.accessoryType = UITableViewCellAccessoryType.none
        }
    }
}

