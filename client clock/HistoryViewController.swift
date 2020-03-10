//
//  HistoryViewController.swift
//  client clock
//
//  Created by EDUARDO MENDOZA on 3/10/20.
//  Copyright © 2020 EDUARDO MENDOZA. All rights reserved.
//

import UIKit
public let defualts = UserDefaults.standard
class HistoryViewController: UITableViewController {
    
    var useCaseListArray: [String] = []
    @IBOutlet weak var enterItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedList = defualts.object(forKey: "useCaseList"){
            useCaseListArray = savedList as! [String]
            tableView.reloadData()
        }
    }
    
    //        let item = enterItemTextField.text
    //        useCaseListArray.append(item!)
    //        defualts.set(useCaseListArray, forKey: "useCaseList")
    //        tableView.reloadData()
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useCaseListArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = useCaseListArray[indexPath.row]
        return cell!
    }
    
    
    
    
    
    
}


