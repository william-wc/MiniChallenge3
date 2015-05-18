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
    
    var list = [String]()
    var data:AnyObject!
    var didAppear:Bool = false
    
    /*
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableSize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        didAppear = false
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        didAppear = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tableViewHideCells()
    }
    
    /*
    
    */
    func tableSize() {
        var query = PFQuery(className:"Exatas")
        
        query.findObjectsInBackgroundWithBlock {
            (items: [AnyObject]?,erro: NSError?) -> Void in
            
            for i in 0 ... items!.count-1 {
                var obj = items![i] as! PFObject
                self.list.append(obj["descricao"]! as! String)
            }
            self.tableView.reloadData()
        }
    }
    
    /*
    Data Source / Delegate
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as! CategoryCell
        var valor = self.list[indexPath.row]
        
        cell.name.text = valor
        
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let delay = didAppear ? 0 : 0.3 + 0.13 * Double(indexPath.row)
        (cell as! BaseAnimatableCell).animateIn(delay, indexPath: indexPath)
    }
    
    func tableViewHideCells() {
        let paths = tableView.indexPathsForVisibleRows() as! [NSIndexPath]
        for i:Int in 0...paths.count-1 {
            var path = paths[i]
            var cell = tableView.cellForRowAtIndexPath(path) as! BaseAnimatableCell
            var delay = 0.13 * Double(i)
            cell.animateOut(delay, indexPath: path)
        }
    }
    
}
