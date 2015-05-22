//
//  Content3ViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class Content3ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    let CellIdentifier   = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[Pergunta] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    /*
    DataSource / Delegate
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! Content3Cell
        let d = data[indexPath.row]
        
        cell.txtLabel.text = d.titulo
        
        return cell
    }
    
}
