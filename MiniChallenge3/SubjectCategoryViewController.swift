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
    
    private let anim_delay = 0.3
    private let anim_cell_delay = 0.13
    
    @IBOutlet weak var tableView:UITableView!
    
    var SubjectKey: String!
    
    private var list:[Materia] = []
    private var didAppear:Bool = false
    
    var valueToPass:String!
    
    /*
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRectZero)
        ConnectionManager.readyMateria("Exatas", onComplete: { (materias) -> Void in
            self.list = materias
            self.tableView.reloadData()
        })
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segue" {
            var viewController = segue.destinationViewController as? ContentViewController
            viewController!.mudar = valueToPass
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
        var materia = self.list[indexPath.row]
        
        cell.name.text = materia.descricao
        cell.iconImage.image = UIImage(named: "")
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            if let url = NSURL(string: "") {
                if let data = NSData(contentsOfURL: url) {
                    dispatch_sync(dispatch_get_main_queue(), { () -> Void in
                        let image = UIImage(data: data)
                        cell.iconImage.image = image
                    })
                }
            }
        })
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Vc selecionou \(indexPath.row)")
        let indexPath = tableView.indexPathForSelectedRow()
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as! CategoryCell
        println("\(currentCell)")
        valueToPass = currentCell.name!.text
        
        performSegueWithIdentifier("segue", sender: self)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let delay = didAppear ? 0 : anim_delay + anim_cell_delay * Double(indexPath.row)
        (cell as! BaseAnimatableCell).animateIn(delay, indexPath: indexPath)
    }
    
    func tableViewHideCells() {
        let paths = tableView.indexPathsForVisibleRows() as! [NSIndexPath]
        for i:Int in 0...paths.count-1 {
            var path = paths[i]
            var cell = tableView.cellForRowAtIndexPath(path) as! BaseAnimatableCell
            var delay = anim_cell_delay * Double(i)
            cell.animateOut(delay, indexPath: path)
        }
    }
    
}
