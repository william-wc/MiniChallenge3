//
//  SubjectCategoryViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/12/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

class SubjectCategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    
    var data:AnyObject!
    
    /*
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    /*
    Data Source / Delegate
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.tableSize()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        return cell
    }
    
    
    func tableSize() -> Int{
        
        var query = PFQuery(className:"Exatas")
        var p = 0

        query.findObjectsInBackgroundWithBlock {
            (items: [AnyObject]?,erro: NSError?) -> Void in
            
            var y = items?[0] as! PFObject
            p = items!.count
            tableView.reloadData()
            
        }
        
        return p
        
    }
    
    
    
    
    
    
    
}
