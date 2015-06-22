//
//  QuizController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/20/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

extension Array{
    mutating func shuffle(){
        for _ in 0...self.count-1 {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

class QuizViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    @IBOutlet var question: UITextView!
    @IBOutlet var tvOp: UITableView!
    
    var data:Pergunta!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.editable = false
        self.update()
    }
    
    func update() {
        self.question.text = data.titulo
        tvOp.reloadData()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destView: AnswerViewController = segue.destinationViewController as! AnswerViewController
        destView.data = data
    }
    
    /*
    DataSource / Delegate
    */
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.alternativas.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! QuizCell
        cell.options.text = String(data.alternativas[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as! QuizCell
        
        if indexPath.row == data.indexResp {
            cell.backgroundColor = UIColor.greenColor()
        } else {
            cell.backgroundColor = UIColor.redColor()
            self.performSegueWithIdentifier("wrong", sender: self)
        }
    
        //var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
    }

    
    
    
    
}