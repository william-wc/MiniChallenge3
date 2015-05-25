//
//  Content3ViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class Content1ViewController: BaseUIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let CellIdentifierImage   = "cell_image"
    let CellIdentifierText    = "cell_text"
    
    let anim_delay = 0.5
    let anim_cell_delay = 0.2
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[String] = []
    
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
    
    func isImage(str:String) -> Bool {
        let pattern = NSRegularExpression(pattern: "\\.(jpg|jpeg|png)$", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
        let range = NSMakeRange(0, count(str))
        let result = pattern!.numberOfMatchesInString(str, options: NSMatchingOptions.allZeros, range: range)
        return result > 0
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
        let d = data[indexPath.row]
        
        if isImage(d) {
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifierImage) as! Content1Cell
            
            let url = NSURL(string: d)
            let request = NSURLRequest(URL: url!)
            NSURLConnection.sendAsynchronousRequest(
                request,
                queue: NSOperationQueue.mainQueue(),
                completionHandler: { (urlResponse, data, error) -> Void in
                    if error == nil {
                        let image = UIImage(data: data)
                        cell.contentImage?.image = image
                    }
            })
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifierText) as! Content1Cell
            cell.contentText?.text = d
        }
        
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
