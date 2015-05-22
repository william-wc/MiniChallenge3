//
//  Content3ViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class Content1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let CellIdentifierImage   = "cell_image"
    let CellIdentifierText    = "cell_text"
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[String] = []
    
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
        var cell:Content1Cell!
        
        if indexPath.row % 2 == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifierImage) as! Content1Cell
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifierText) as! Content1Cell
        }
        
        return cell
    }
    
}
