//
//  SideMenuViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/12/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

@objc
protocol SideMenuViewControllerDelegate {
    optional func itemSelected(index:Int)
}

class MenuItem {
    
    var name:String
    var image:UIImage
    
    init(name:String, imageName:String) {
        self.name = name
        self.image = UIImage(named: imageName)!
    }
    
}

class SideMenuViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let options = [
        MenuItem(name: "Matérias", imageName: "icon center")
        ,MenuItem(name: "Usuário", imageName: "icon user")
        ,MenuItem(name: "Quiz", imageName: "icon question")
    ]
    
    var delegate:SideMenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    /*
    Data Source / Delegate
    */
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SideMenuCell
        let data = options[indexPath.row]
        
        cell.lblText.text = data.name
        cell.iconImage.image = data.image
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
        (tableView.cellForRowAtIndexPath(indexPath) as! SideMenuCell).setHighlighted(true, animated: true)
    }
    
    override func tableView(tableView: UITableView, didUnhighlightRowAtIndexPath indexPath: NSIndexPath) {
        (tableView.cellForRowAtIndexPath(indexPath) as! SideMenuCell).setHighlighted(false, animated: true)
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.itemSelected?(indexPath.row)
    }
}
