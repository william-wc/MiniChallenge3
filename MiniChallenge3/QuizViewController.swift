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

class quizData {
    var questions: String!
    var alt: [String]!
    init (questions: String, alt: [String]){
        self.questions = questions
        self.alt = alt
    }
}

class QuizViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    var list = [quizData(questions: "Quanto é 1+1?", alt: ["2", "4", "1", "3"]),
        quizData(questions: "O iPhone pertence a qual empresa?", alt: ["Apple", "Samsung", "Microsoft", "Google"]),quizData(questions: "Quantos anos vc tem?", alt: ["21", "19", "31", "24"]),quizData(questions: "Qual a derivada de x?", alt: ["1", "2x", "0", "x"])]

    var index: Int = 0

    @IBOutlet var question: UITextView!
    var pos: Int = 0
    @IBOutlet var tvOp: UITableView!
    var ind: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.editable = false
        self.update()
        self.question.text = list[index].questions
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! QuizCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.options.text = list[index].alt[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    func update(){
        var right = list[index].alt[0]
        println(right)
        
        list[index].alt.shuffle()
        
        
        for i in 0...list[index].alt.count-1{
            if right == list[index].alt[i]{
                pos = i
            
            }
        }

        tvOp.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var cell = tableView.cellForRowAtIndexPath(indexPath) as! QuizCell
        
        if indexPath.row == pos {
            index++
            cell.backgroundColor = UIColor.greenColor()
            self.question.text = list[index].questions
            
            for i in 0...list[index].alt.count-1{
                cell.options.text = list[index].alt[i]
            }
        }
        else{
            index++
            
            for i in 0...list[index].alt.count-1{
                
                cell.options.text = list[index].alt[i]
            }
            cell.backgroundColor = UIColor.redColor()
            
            self.performSegueWithIdentifier("wrong", sender: self)
            
            self.question.text = list[index].questions
            
        }
        

        var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destView: AnswerViewController = segue.destinationViewController as! AnswerViewController
        destView.index = index
    }
}