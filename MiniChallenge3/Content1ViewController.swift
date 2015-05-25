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
    
    func isImage(str:String) -> Bool {
        let pattern = NSRegularExpression(pattern: "\\.(jpg|jpeg|png)$", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)
        let range = NSMakeRange(0, count(str))
        let result = pattern!.numberOfMatchesInString(str, options: NSMatchingOptions.allZeros, range: range)
        return result > 0
    }
    
}
