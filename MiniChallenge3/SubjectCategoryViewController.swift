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
    
    var valueToPass:String!
    
    var list = [String]()
    
    @IBOutlet weak var tableView:UITableView!
    
    var data:AnyObject!
    
    /*
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableSize()
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
    
   
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Vc selecionou \(indexPath.row)")
        let indexPath = tableView.indexPathForSelectedRow()
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as! CategoryCell
        println("\(currentCell)")
        valueToPass = currentCell.name!.text
        
        performSegueWithIdentifier("segue", sender: self)
        
        
    
    }
    
    override func  prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "segue"){
           
            
            var viewController = segue.destinationViewController as? ContentViewController
            
            viewController!.mudar = valueToPass
            
            
        }
        
    
    }
    
    
    
    
    

    
    
    
}
