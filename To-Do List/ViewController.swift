//
//  ViewController.swift
//  To-Do List
//
//  Created by Judy Chin on 2022/3/9.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var buttonAdd: UIButton!
    
    @IBAction func PrimaryAction(_ sender: Any) {
        newItem()
    }
    
    var items = [
        "Apple", "Beef", "Milk", "Tissue", "Trash bag", "Toothpaste", "Shampoo"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func buttonPush(_ sender: Any) {
        newItem()
    }
    
    
    func newItem() {
        items.append(textField.text!)
        textField.text = ""
        UIView.transition(with: tableView, duration: 0.4, options: .transitionCrossDissolve, animations: {self.tableView.reloadData()}, completion: nil)
    }
    
}




extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    //func tableView(_ tableView: UITableView, titleForHeaderInSection
    //                            section: Int) -> String? {
    //   return "List"
    //}
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}
