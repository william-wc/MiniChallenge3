//
//  Content3ViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class Content3ViewController: BaseUIViewController , UITableViewDelegate, UITableViewDataSource {
    
    let CellIdentifier   = "cell"
    
    let anim_delay = 0.5
    let anim_cell_delay = 0.10
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[Pergunta] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tableViewWillHideCells()
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
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let delay = didAppear ? 0 : anim_delay + anim_cell_delay * Double(indexPath.row)
        (cell as! BaseAnimatableCell).animateIn(delay, indexPath: indexPath)
    }
    
    func tableViewWillHideCells() {
        let paths = tableView.indexPathsForVisibleRows() as! [NSIndexPath]
        if paths.count > 0 {
            for i:Int in 0...paths.count-1 {
                var path = paths[i]
                var cell = tableView.cellForRowAtIndexPath(path) as! BaseAnimatableCell
                var delay = anim_cell_delay * Double(Int(i / 2))
                cell.animateOut(delay, indexPath: path)
            }
        }
    }
    
}
